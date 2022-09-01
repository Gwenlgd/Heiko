class ReportMood < ApplicationRecord
  belongs_to :mood
  belongs_to :report

  def index
    @reportMoods = ReportMood.all
  end
end
