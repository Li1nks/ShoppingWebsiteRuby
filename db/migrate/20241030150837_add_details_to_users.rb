class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
  end
end
