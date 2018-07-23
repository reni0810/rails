# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_23_064148) do

  create_table "cuisines", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.integer "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuisine_id"], name: "index_recipes_on_cuisine_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "address", limit: 1000
    t.string "mobile_no", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile_no"], name: "index_restaurants_on_mobile_no", unique: true
  end

  create_table "restaurants_cuisines", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuisine_id"], name: "index_restaurants_cuisines_on_cuisine_id"
    t.index ["restaurant_id"], name: "index_restaurants_cuisines_on_restaurant_id"
  end

  create_table "restaurants_facilities", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_restaurants_facilities_on_facility_id"
    t.index ["restaurant_id"], name: "index_restaurants_facilities_on_restaurant_id"
  end

  create_table "restaurants_users", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurants_users_on_restaurant_id"
    t.index ["user_id"], name: "index_restaurants_users_on_user_id"
  end

  create_table "timings", force: :cascade do |t|
    t.string "day", limit: 3
    t.time "start_time"
    t.time "end_time"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_timings_on_restaurant_id"
  end

  create_table "unavailabities", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.boolean "full_day"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_unavailabities_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "mobile_no", limit: 15
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
