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

ActiveRecord::Schema.define(version: 2019_09_20_090724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistances", force: :cascade do |t|
    t.integer "name"
    t.bigint "report_id"
    t.time "start_time"
    t.time "end_time"
    t.text "description"
    t.text "note"
    t.bigint "category_id"
    t.bigint "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_assistances_on_category_id"
    t.index ["office_id"], name: "index_assistances_on_office_id"
    t.index ["report_id"], name: "index_assistances_on_report_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "name"
    t.date "date"
    t.bigint "location_id"
    t.bigint "structure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assistance_id"
    t.bigint "user_id"
    t.index ["assistance_id"], name: "index_reports_on_assistance_id"
    t.index ["location_id"], name: "index_reports_on_location_id"
    t.index ["structure_id"], name: "index_reports_on_structure_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_structures_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "name"
    t.date "transfer_date"
    t.time "departure"
    t.string "start_point"
    t.string "start_address"
    t.time "arrival"
    t.string "destination"
    t.string "destination_address"
    t.decimal "path_lenght"
    t.bigint "transport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "travel_time"
    t.text "note"
    t.bigint "user_id"
    t.index ["transport_id"], name: "index_transfers_on_transport_id"
    t.index ["user_id"], name: "index_transfers_on_user_id"
  end

  create_table "transports", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_transports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_type", default: "regular", null: false
    t.string "name", default: "", null: false
    t.string "forename", default: "", null: false
    t.string "department", default: "", null: false
    t.string "office", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assistances", "categories"
  add_foreign_key "assistances", "offices"
  add_foreign_key "assistances", "reports"
  add_foreign_key "categories", "users"
  add_foreign_key "locations", "users"
  add_foreign_key "offices", "users"
  add_foreign_key "reports", "assistances"
  add_foreign_key "reports", "locations"
  add_foreign_key "reports", "structures"
  add_foreign_key "reports", "users"
  add_foreign_key "structures", "users"
  add_foreign_key "transfers", "transports"
  add_foreign_key "transfers", "users"
  add_foreign_key "transports", "users"
end
