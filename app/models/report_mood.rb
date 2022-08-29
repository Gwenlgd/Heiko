class ReportMood < ApplicationRecord
  belongs_to :mood
  belongs_to :report
end
