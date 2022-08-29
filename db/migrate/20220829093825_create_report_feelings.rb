class CreateReportFeelings < ActiveRecord::Migration[7.0]
  def change
    create_table :report_feelings do |t|
      t.date :date
      t.references :report, null: false, foreign_key: true
      t.references :feeling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
