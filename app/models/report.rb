class Report < ApplicationRecord
  belongs_to :user
  has_many :report_feelings
  has_many :report_moods
  has_many :report_food_items
  has_many :moods, through: :report_moods


end
