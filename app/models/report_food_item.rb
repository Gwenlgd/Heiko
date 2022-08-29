class ReportFoodItem < ApplicationRecord
  belongs_to :report
  belongs_to :food_item
end
