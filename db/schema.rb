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

ActiveRecord::Schema.define(version: 20170425092750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employee_projects", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "project_id"
    t.integer  "role_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_employee_projects_on_employee_id", using: :btree
    t.index ["project_id"], name: "index_employee_projects_on_project_id", using: :btree
    t.index ["role_id"], name: "index_employee_projects_on_role_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "code"
    t.boolean  "is_admin",               default: false
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "role_type"
    t.index ["email"], name: "index_employees_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_employees_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "project_type"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "hours"
    t.boolean  "is_billable",  default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_entries", force: :cascade do |t|
    t.date     "date"
    t.integer  "mentor_id"
    t.text     "task"
    t.float    "hours"
    t.boolean  "is_billable", default: false
    t.integer  "employee_id"
    t.integer  "project_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["employee_id"], name: "index_time_entries_on_employee_id", using: :btree
    t.index ["project_id"], name: "index_time_entries_on_project_id", using: :btree
  end

end
