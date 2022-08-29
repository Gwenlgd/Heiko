class AddDateTime < ActiveRecord::Migration[7.0]
  def change
    remove_column :report_feelings, :date
    add_column :report_feelings, :date_time, :datetime
    add_column :report_moods, :date_time, :datetime
    add_column :report_food_items, :date_time, :datetime
  end
end
