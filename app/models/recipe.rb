class Recipe < ApplicationRecord
  has_many :recipe_food_items, dependent: :destroy
  has_many :food_items, through: :recipe_food_items
  accepts_nested_attributes_for :recipe_food_items
end
