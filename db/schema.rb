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

ActiveRecord::Schema.define(version: 20150217031727) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certificate_categories", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certificate_types", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.boolean  "is_default"
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
    t.integer  "certificate_type_id"
    t.integer  "certificate_category_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "flag_id"
    t.boolean  "is_reverting"
  end

  create_table "classification_societies", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
  end

  create_table "crew_office_evaluations", force: true do |t|
    t.integer  "vessel_id"
    t.integer  "crew_id"
    t.date     "date_of_evaluation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "crew_vessel_evaluations", force: true do |t|
    t.integer  "vessel_id"
    t.integer  "crew_id"
    t.date     "date_of_evaluation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string   "recommendation_letter_file_name"
    t.string   "recommendation_letter_content_type"
    t.integer  "recommendation_letter_file_size"
    t.datetime "recommendation_letter_updated_at"
    t.string   "training_record_file_name"
    t.string   "training_record_content_type"
    t.integer  "training_record_file_size"
    t.datetime "training_record_updated_at"
  end

  create_table "crews", force: true do |t|
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
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "signature_file_name"
    t.string   "signature_content_type"
    t.integer  "signature_file_size"
    t.datetime "signature_updated_at"
    t.string   "pagibig_number"
    t.string   "philhealth_number"
    t.string   "distinguishing_marks"
    t.date     "sign_on"
    t.date     "date_of_promotion"
    t.string   "city_address"
    t.string   "provincial_address"
    t.string   "zip_code"
    t.string   "blood_type"
    t.string   "father_name"
    t.string   "mother_maiden_name"
    t.string   "spouse_name"
    t.integer  "number_of_children"
    t.boolean  "is_smoker"
    t.string   "blood_pressure"
    t.string   "status"
    t.string   "crew_token"
    t.integer  "manning_agent_id"
  end

  create_table "document_kinds", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.boolean  "is_default"
  end

  create_table "documents", force: true do |t|
    t.integer  "crew_id"
    t.string   "name"
    t.string   "doc_number"
    t.date     "issued_at"
    t.date     "expiry_date"
    t.string   "issued_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "document_kind_id"
    t.boolean  "is_reverting"
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
    t.date     "sign_on"
    t.date     "sign_off"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crew_id"
    t.integer  "rank_id"
    t.integer  "manning_agent_id"
    t.integer  "reason_for_disembarkation_id"
    t.string   "other_vessel"
    t.boolean  "is_other_vessel"
    t.integer  "horse_power"
    t.string   "engine_make"
    t.string   "engine_model"
    t.string   "off_numb"
    t.decimal  "grt"
    t.decimal  "nrt"
    t.decimal  "dwt"
    t.decimal  "loa"
    t.decimal  "breadth"
    t.decimal  "depth"
    t.integer  "principal_id"
  end

  create_table "flags", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "license_categories", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
  end

  create_table "license_types", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.integer  "priority"
    t.integer  "license_category_id"
    t.boolean  "is_default"
  end

  create_table "licenses", force: true do |t|
    t.integer  "crew_id"
    t.string   "country"
    t.string   "kind"
    t.string   "license_number"
    t.date     "date_issued"
    t.date     "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "license_type_id"
    t.integer  "rank_id"
    t.integer  "license_category_id"
    t.integer  "training_center_id"
    t.integer  "priority"
    t.boolean  "is_reverting"
  end

  create_table "manning_agents", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
  end

  create_table "poea_companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principal_contact_people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.string   "email"
    t.string   "designation"
    t.integer  "principal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principals", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "telephone_number"
    t.string   "fax_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.decimal  "priority",          precision: 18, scale: 15
  end

  create_table "reason_for_disembarkations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salary_scales", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.decimal  "basic_pay"
    t.decimal  "seniority_allowance"
    t.decimal  "command_allowance"
    t.decimal  "supervisory_allowance"
    t.decimal  "guaranteed_overtime"
    t.decimal  "fixed_overtime"
    t.decimal  "leave_pay"
    t.decimal  "good_performance_bonus"
    t.decimal  "subsistence_allowance"
  end

  create_table "training_centers", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transmittal_record_crew_promotions", force: true do |t|
    t.integer  "crew_id"
    t.integer  "from_rank_id"
    t.integer  "to_rank_id"
    t.integer  "transmittal_record_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transmittal_record_disembarking_crews", force: true do |t|
    t.integer  "transmittal_record_id"
    t.integer  "crew_id"
    t.integer  "rank_id"
    t.integer  "reason_for_disembarkation_id"
    t.date     "date_embarked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manning_agent_id"
    t.date     "sign_off"
  end

  create_table "transmittal_record_document_kinds", id: false, force: true do |t|
    t.integer "transmittal_record_id"
    t.integer "document_kind_id"
  end

  add_index "transmittal_record_document_kinds", ["transmittal_record_id", "document_kind_id"], name: "tr_dk_index", unique: true

  create_table "transmittal_record_embarking_crews", force: true do |t|
    t.integer  "transmittal_record_id"
    t.integer  "crew_id"
    t.integer  "rank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manning_agent_id"
    t.date     "date_embarked"
  end

  create_table "transmittal_record_license_types", id: false, force: true do |t|
    t.integer "transmittal_record_id"
    t.integer "license_type_id"
  end

  add_index "transmittal_record_license_types", ["transmittal_record_id", "license_type_id"], name: "tr_lt_index", unique: true

  create_table "transmittal_records", force: true do |t|
    t.string   "prepared_by"
    t.string   "prepared_by_position"
    t.string   "approved_by"
    t.string   "approved_by_position"
    t.string   "noted_by"
    t.string   "noted_by_position"
    t.string   "destination"
    t.date     "date_of_departure"
    t.date     "prepared_on"
    t.integer  "vessel_id"
    t.string   "transmittal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
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
    t.string   "user_type"
    t.string   "access_token"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "principal_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vessel_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vessels", force: true do |t|
    t.string   "name"
    t.string   "flag"
    t.integer  "horse_power"
    t.string   "engine_make"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vessel_type_id"
    t.string   "owner"
    t.string   "off_numb"
    t.string   "code"
    t.integer  "principal_id"
    t.integer  "poea_company_id"
    t.integer  "flag_id"
    t.integer  "salary_scale_id"
    t.string   "email"
    t.string   "inmarsat_id_number"
    t.string   "tel_number"
    t.string   "fax_number"
    t.string   "imo_number"
    t.string   "callsign"
    t.integer  "classification_society_id"
    t.decimal  "grt"
    t.decimal  "nrt"
    t.decimal  "dwt"
    t.decimal  "loa"
    t.decimal  "breadth"
    t.decimal  "depth"
    t.string   "engine_model"
    t.string   "ecdis"
    t.string   "type_of_lifeboat"
    t.string   "status"
    t.string   "port_of_registry"
    t.decimal  "bale"
    t.decimal  "grain"
    t.string   "vessel_image_file_name"
    t.string   "vessel_image_content_type"
    t.integer  "vessel_image_file_size"
    t.datetime "vessel_image_updated_at"
  end

end
