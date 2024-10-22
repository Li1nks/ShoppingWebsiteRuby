class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def self.schema
    table_info = connection.execute("PRAGMA table_list(#{table_name});").first
    columns_info = connection.execute("PRAGMA table_xinfo(#{table_name});")
    index_info = connection.execute("PRAGMA index_list(#{table_name});")
    fk_info = connection.execute("PRAGMA foreign_key_list(#{table_name});")
    table_sql = connection.exec_query(<<~SQL, "SQL", [ table_name ]).first
      SELECT sql
      FROM (
        SELECT * FROM main.sqlite_schema UNION ALL
        SELECT * FROM temp.sqlite_schema
      )
      WHERE type = 'table'
        AND name = ?;
    SQL
    column_names = columns_info.map { |column| column["name"] }

    collate_regex = /COLLATE\s+(\w+).*/i
    primary_key_autoincrement_regex = /PRIMARY KEY AUTOINCREMENT/i
    unquoted_open_parens_regex = /\((?![^'"]*['"][^'"]*$)/
    final_close_parens_regex = /\);*\z/
    column_separator_regex = /,(?=\s(?:CONSTRAINT|"(?:#{Regexp.union(column_names).source})"))/i

    column_defs = table_sql["sql"]
      .partition(unquoted_open_parens_regex)
      .last
      .sub(final_close_parens_regex, "")
      .split(column_separator_regex)
      .map do |definition|
        definition = definition.strip
        key = definition.partition(" ").first.gsub(/^"*|"*$/, "")
        [ key, definition ]
      end
      .to_h

    {
      schema: table_info["schema"],
      name: table_info["name"],
      sql: table_sql["sql"],
      without_rowid: table_info["wr"] == 1,
      strict: table_info["strict"] == 1,
      columns: columns_info.map do |column_info|
        column_string = column_defs[column_info["name"]]

        { name: column_info["name"],
          type: column_info["type"],
          sql: column_string,
          nullable: column_info["notnull"] == 0,
          default: column_info["dflt_value"],
          primary_key: column_info["pk"],
          kind: case column_info["hidden"]
                when 0 then :normal
                when 1 then :virtual
                when 2 then :dynamic
                when 3 then :stored
                end,
          collation: ($1 if collate_regex =~ column_string),
          autoincrement: column_string.match?(primary_key_autoincrement_regex) }
      end,
      indexes: index_info.map do |index_info|
        { name: index_info["name"],
          unique: index_info["unique"] == 1,
          origin: case index_info["origin"]
                  when "c" then :create_index
                  when "u" then :unique_constraint
                  when "pk" then :primary_key_constraint
                  end,
          partial: index_info["partial"] == 1 }
      end,
      foreign_keys: fk_info.map do |fk_info|
        { table: fk_info["table"],
          from: fk_info["from"],
          to: fk_info["to"],
          on_update: fk_info["on_update"],
          on_delete: fk_info["on_delete"],
          match: fk_info["match"] }
      end
    }
  end
end
