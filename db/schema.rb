# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140408135656) do

  create_table "Crews", force: true do |t|
    t.string   "form_number"
    t.string   "code_number"
    t.date     "date_employed"
    t.date     "date_printed"
    t.integer  "rank_id"
    t.integer  "vessel_id"
    t.string   "lastname"
    t.string   "firstname"
    t.date     "birthday"
    t.string   "birthplace"
    t.string   "telephone_no"
    t.string   "nationality"
    t.string   "civil_status"
    t.integer  "age"
    t.decimal  "height"
    t.decimal  "weight"
    t.string   "eye_color"
    t.string   "sss_no"
    t.string   "tin_no"
    t.string   "shoe_size"
    t.string   "cloth_size"
    t.string   "nearest_relative_name"
    t.string   "nearest_relative_relationship"
    t.text     "nearest_relative_address"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middlename"
    t.string   "cellphone_no"
  end

  create_table "certificates", force: true do |t|
    t.integer  "crew_id"
    t.string   "name"
    t.string   "certificate_number"
    t.date     "date_issued"
    t.date     "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "issued_by"
  end

  create_table "educational_attainments", force: true do |t|
    t.integer  "crew_id"
    t.integer  "year_graduated"
    t.string   "school"
    t.string   "course_finished"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employment_records", force: true do |t|
    t.integer  "vessel_id"
    t.string   "manning_agent"
    t.string   "rank"
    t.date     "sign_on"
    t.date     "sign_off"
    t.string   "reason_of_disembarkation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", force: true do |t|
    t.integer  "crew_id"
    t.string   "country"
    t.string   "kind"
    t.string   "license_number"
    t.date     "date_issued"
    t.date     "expiry_date"
    t.string   "issued_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vessels", force: true do |t|
    t.string   "name"
    t.string   "flag"
    t.string   "vessel_type"
    t.integer  "horse_power"
    t.string   "engine_make"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
