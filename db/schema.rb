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

ActiveRecord::Schema.define(version: 2019_10_21_154222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "apartment_images", force: :cascade do |t|
    t.bigint "apartment_id"
    t.string "content"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_apartment_images_on_apartment_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.string "address", null: false
    t.text "description", null: false
    t.integer "count_rooms", limit: 2, default: 0, null: false
    t.integer "comfort_level", limit: 2, default: 0, null: false
    t.decimal "hour_price", precision: 10, scale: 2
    t.decimal "day_price", precision: 10, scale: 2
    t.string "owner_name", null: false
    t.string "owner_phone", null: false
    t.float "latitude"
    t.float "longitude"
    t.bigint "city_region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.text "lead"
    t.boolean "removed", default: false, null: false
    t.index ["city_region_id"], name: "index_apartments_on_city_region_id"
    t.index ["slug"], name: "index_apartments_on_slug", unique: true
  end

  create_table "city_regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.bigint "admin_user_id", null: false
    t.string "value", null: false
    t.datetime "expires_in", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_tokens_on_admin_user_id"
    t.index ["value"], name: "index_tokens_on_value", unique: true
  end

  add_foreign_key "apartments", "city_regions"
  add_foreign_key "tokens", "admin_users"
end
