# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_29_100633) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feelings", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.string "allergen"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_food_items_on_recipe_id"
  end

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_feelings", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "feeling_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_time"
    t.index ["feeling_id"], name: "index_report_feelings_on_feeling_id"
    t.index ["report_id"], name: "index_report_feelings_on_report_id"
  end

  create_table "report_food_items", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "food_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_time"
    t.index ["food_item_id"], name: "index_report_food_items_on_food_item_id"
    t.index ["report_id"], name: "index_report_food_items_on_report_id"
  end

  create_table "report_moods", force: :cascade do |t|
    t.bigint "mood_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_time"
    t.index ["mood_id"], name: "index_report_moods_on_mood_id"
    t.index ["report_id"], name: "index_report_moods_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "meal_type"
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "gender"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "food_items", "recipes"
  add_foreign_key "report_feelings", "feelings"
  add_foreign_key "report_feelings", "reports"
  add_foreign_key "report_food_items", "food_items"
  add_foreign_key "report_food_items", "reports"
  add_foreign_key "report_moods", "moods"
  add_foreign_key "report_moods", "reports"
  add_foreign_key "reports", "users"
end
