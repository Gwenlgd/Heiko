class AddNutrientsToFoodItems < ActiveRecord::Migration[7.0]
  def change
    add_column :food_items, :nutrients, :json
  end
end
