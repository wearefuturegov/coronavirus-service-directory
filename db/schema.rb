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

ActiveRecord::Schema.define(version: 2020_03_28_221305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "long_name"
  end

  create_table "categories_services", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "service_id", null: false
    t.index ["category_id"], name: "index_categories_services_on_category_id"
    t.index ["service_id"], name: "index_categories_services_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "postcode"
    t.string "key_point_1"
    t.string "key_point_2"
    t.string "key_point_3"
    t.boolean "recommended"
    t.string "how_to_contact"
    t.string "email"
  end

end
