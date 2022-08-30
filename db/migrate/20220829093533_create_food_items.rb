class CreateFoodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :allergen
      t.references :recipe, null: true, foreign_key: true

      t.timestamps
    end
  end
end
