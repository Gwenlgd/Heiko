class AddColumnsToReportFoodItems < ActiveRecord::Migration[7.0]
  def change
    add_column :report_food_items, :meal_type, :string
  end
end
