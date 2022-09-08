class RemoveJson < ActiveRecord::Migration[7.0]
  def change
    remove_column :food_items, :nutrients
  end
end
