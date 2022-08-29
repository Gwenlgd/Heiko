class CreateReportMoods < ActiveRecord::Migration[7.0]
  def change
    create_table :report_moods do |t|
      t.references :mood, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
