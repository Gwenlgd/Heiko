class FoodItem < ApplicationRecord
  belongs_to :recipe, optional: true
  has_many :report_food_items
end
