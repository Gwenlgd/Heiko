class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :meal_type
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
