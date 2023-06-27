class CreateFoodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.references :shopping_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
