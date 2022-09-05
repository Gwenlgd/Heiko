class Report < ApplicationRecord
  belongs_to :user
  has_many :report_feelings, dependent: :destroy
  has_many :report_moods, dependent: :destroy 
  has_many :report_food_items, dependent: :destroy
  has_many :moods, through: :report_moods
end
