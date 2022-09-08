class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food_items
  has_many :food_items, through: :recipe_food_items
  accepts_nested_attributes_for :recipe_food_items
end
