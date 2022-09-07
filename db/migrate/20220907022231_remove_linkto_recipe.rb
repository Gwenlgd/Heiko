class RemoveLinktoRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_reference :food_items, :recipe, index: true, foreign_key: true
  end
end
