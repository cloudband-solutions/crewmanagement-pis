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

ActiveRecord::Schema.define(version: 20150420140820) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certificate_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certificate_types", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "code",              limit: 255
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.boolean  "is_default"
  end

  create_table "certificates", force: :cascade do |t|
    t.integer  "crew_id"
    t.string   "name",                    limit: 255
    t.string   "certificate_number",      limit: 255
    t.date     "date_issued"
    t.date     "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "issued_by",               limit: 255
    t.integer  "certificate_type_id"
    t.integer  "certificate_category_id"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "flag_id"
    t.boolean  "is_reverting"
    t.boolean  "no_expiry"
  end

  create_table "classification_societies", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "code",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
  end

  create_table "crew_office_evaluations", force: :cascade do |t|
    t.integer  "vessel_id"
    t.integer  "crew_id"
    t.date     "date_of_evaluation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "crew_vessel_evaluations", force: :cascade do |t|
    t.integer  "vessel_id"
    t.integer  "crew_id"
    t.date     "date_of_evaluation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",               limit: 255
    t.string   "attachment_content_type",            limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string   "recommendation_letter_file_name",    limit: 255
    t.string   "recommendation_letter_content_type", limit: 255
    t.integer  "recommendation_letter_file_size"
    t.datetime "recommendation_letter_updated_at"
    t.string   "training_record_file_name",          limit: 255
    t.string   "training_record_content_type",       limit: 255
    t.integer  "training_record_file_size"
    t.datetime "training_record_updated_at"
  end

  create_table "crews", force: :cascade do |t|
    t.string   "form_number",                   limit: 255
    t.string   "code_number",                   limit: 255
    t.date     "date_employed"
    t.date     "date_printed"
    t.integer  "rank_id"
    t.integer  "vessel_id"
    t.string   "lastname",                      limit: 255
    t.string   "firstname",                     limit: 255
    t.date     "birthday"
    t.string   "birthplace",                    limit: 255
    t.string   "telephone_no",                  limit: 255
    t.string   "nationality",                   limit: 255
    t.string   "civil_status",                  limit: 255
    t.decimal  "height"
    t.decimal  "weight"
    t.string   "eye_color",                     limit: 255
    t.string   "sss_no",                        limit: 255
    t.string   "tin_no",                        limit: 255
    t.string   "shoe_size",                     limit: 255
    t.string   "cloth_size",                    limit: 255
    t.string   "nearest_relative_name",         limit: 255
    t.string   "nearest_relative_relationship", limit: 255
    t.text     "nearest_relative_address"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middlename",                    limit: 255
    t.string   "cellphone_no",                  limit: 255
    t.string   "picture_file_name",             limit: 255
    t.string   "picture_content_type",          limit: 255
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "signature_file_name",           limit: 255
    t.string   "signature_content_type",        limit: 255
    t.integer  "signature_file_size"
    t.datetime "signature_updated_at"
    t.string   "pagibig_number",                limit: 255
    t.string   "philhealth_number",             limit: 255
    t.string   "distinguishing_marks",          limit: 255
    t.date     "sign_on"
    t.date     "date_of_promotion"
    t.string   "city_address",                  limit: 255
    t.string   "provincial_address",            limit: 255
    t.string   "zip_code",                      limit: 255
    t.string   "blood_type",                    limit: 255
    t.string   "father_name",                   limit: 255
    t.string   "mother_maiden_name",            limit: 255
    t.string   "spouse_name",                   limit: 255
    t.integer  "number_of_children"
    t.boolean  "is_smoker"
    t.string   "blood_pressure",                limit: 255
    t.string   "status",                        limit: 255
    t.string   "crew_token",                    limit: 255
    t.integer  "manning_agent_id"
  end

  create_table "document_kinds", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "code",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.boolean  "is_default"
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "crew_id"
    t.string   "name",                    limit: 255
    t.string   "doc_number",              limit: 255
    t.date     "issued_at"
    t.date     "expiry_date"
    t.string   "issued_by",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_type",           limit: 255
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "document_kind_id"
    t.boolean  "is_reverting"
  end

  create_table "educational_attainments", force: :cascade do |t|
    t.integer  "crew_id"
    t.integer  "year_graduated"
    t.string   "school",          limit: 255
    t.string   "course_finished", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employment_records", force: :cascade do |t|
    t.integer  "vessel_id"
    t.date     "sign_on"
    t.date     "sign_off"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crew_id"
    t.integer  "rank_id"
    t.integer  "manning_agent_id"
    t.integer  "reason_for_disembarkation_id"
    t.string   "other_vessel",                 limit: 255
    t.boolean  "is_other_vessel"
    t.integer  "horse_power"
    t.string   "engine_make",                  limit: 255
    t.string   "engine_model",                 limit: 255
    t.string   "off_numb",                     limit: 255
    t.decimal  "grt"
    t.decimal  "nrt"
    t.decimal  "dwt"
    t.decimal  "loa"
    t.decimal  "breadth"
    t.decimal  "depth"
    t.integer  "principal_id"
    t.integer  "transmittal_record_id"
  end

  create_table "flags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "license_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
  end

  create_table "license_types", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "code",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.integer  "priority"
    t.integer  "license_category_id"
    t.boolean  "is_default"
  end

  create_table "licenses", force: :cascade do |t|
    t.integer  "crew_id"
    t.string   "country",                 limit: 255
    t.string   "kind",                    limit: 255
    t.string   "license_number",          limit: 255
    t.date     "date_issued"
    t.date     "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "license_type_id"
    t.integer  "rank_id"
    t.integer  "license_category_id"
    t.integer  "training_center_id"
    t.integer  "priority"
    t.boolean  "is_reverting"
    t.boolean  "no_expiry"
  end

  create_table "manning_agents", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "code",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
  end

  create_table "poea_companies", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principal_contact_people", force: :cascade do |t|
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "contact_number", limit: 255
    t.string   "email",          limit: 255
    t.string   "designation",    limit: 255
    t.integer  "principal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principals", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "address"
    t.string   "email",            limit: 255
    t.string   "telephone_number", limit: 255
    t.string   "fax_number",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "code",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.decimal  "priority",                      precision: 18, scale: 15
  end

  create_table "reason_for_disembarkations", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salary_scales", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
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

  create_table "training_centers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transmittal_record_crew_promotions", force: :cascade do |t|
    t.integer  "crew_id"
    t.integer  "from_rank_id"
    t.integer  "to_rank_id"
    t.integer  "transmittal_record_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_embarked"
  end

  create_table "transmittal_record_disembarking_crews", force: :cascade do |t|
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

  create_table "transmittal_record_document_kinds", id: false, force: :cascade do |t|
    t.integer "transmittal_record_id"
    t.integer "document_kind_id"
  end

  add_index "transmittal_record_document_kinds", ["transmittal_record_id", "document_kind_id"], name: "tr_dk_index", unique: true

  create_table "transmittal_record_embarking_crews", force: :cascade do |t|
    t.integer  "transmittal_record_id"
    t.integer  "crew_id"
    t.integer  "rank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manning_agent_id"
    t.date     "date_embarked"
  end

  create_table "transmittal_record_license_types", id: false, force: :cascade do |t|
    t.integer "transmittal_record_id"
    t.integer "license_type_id"
  end

  add_index "transmittal_record_license_types", ["transmittal_record_id", "license_type_id"], name: "tr_lt_index", unique: true

  create_table "transmittal_records", force: :cascade do |t|
    t.string   "prepared_by",          limit: 255
    t.string   "prepared_by_position", limit: 255
    t.string   "approved_by",          limit: 255
    t.string   "approved_by_position", limit: 255
    t.string   "noted_by",             limit: 255
    t.string   "noted_by_position",    limit: 255
    t.string   "destination",          limit: 255
    t.date     "date_of_departure"
    t.date     "prepared_on"
    t.integer  "vessel_id"
    t.string   "transmittal_code",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",               limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type",              limit: 255
    t.string   "access_token",           limit: 255
    t.string   "first_name",             limit: 255
    t.string   "middle_name",            limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "principal_id"
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vessel_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vessels", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.string   "flag",                      limit: 255
    t.integer  "horse_power"
    t.string   "engine_make",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vessel_type_id"
    t.string   "owner",                     limit: 255
    t.string   "off_numb",                  limit: 255
    t.string   "code",                      limit: 255
    t.integer  "principal_id"
    t.integer  "poea_company_id"
    t.integer  "flag_id"
    t.integer  "salary_scale_id"
    t.string   "email",                     limit: 255
    t.string   "inmarsat_id_number",        limit: 255
    t.string   "tel_number",                limit: 255
    t.string   "fax_number",                limit: 255
    t.string   "imo_number",                limit: 255
    t.string   "callsign",                  limit: 255
    t.integer  "classification_society_id"
    t.decimal  "grt"
    t.decimal  "nrt"
    t.decimal  "dwt"
    t.decimal  "loa"
    t.decimal  "breadth"
    t.decimal  "depth"
    t.string   "engine_model",              limit: 255
    t.string   "ecdis",                     limit: 255
    t.string   "type_of_lifeboat",          limit: 255
    t.string   "status",                    limit: 255
    t.string   "port_of_registry",          limit: 255
    t.decimal  "bale"
    t.decimal  "grain"
    t.string   "vessel_image_file_name",    limit: 255
    t.string   "vessel_image_content_type", limit: 255
    t.integer  "vessel_image_file_size"
    t.datetime "vessel_image_updated_at"
  end

end
