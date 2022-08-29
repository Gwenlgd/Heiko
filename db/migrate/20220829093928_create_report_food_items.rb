class CreateReportFoodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :report_food_items do |t|
      t.references :report, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
