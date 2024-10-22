class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_id
      t.integer :quantity
      t.string :manufacturer
      t.decimal :price
      t.string :food_types
      t.string :array
      t.string :true

      t.timestamps
    end
  end
end
