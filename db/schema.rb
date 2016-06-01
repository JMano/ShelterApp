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

ActiveRecord::Schema.define(version: 20160518203856) do

  create_table "adoptions", force: :cascade do |t|
    t.date     "adoption_date"
    t.integer  "adoption_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "animal_id"
    t.integer  "employee_id"
    t.integer  "user_id"
  end

  add_index "adoptions", ["animal_id"], name: "index_adoptions_on_animal_id"
  add_index "adoptions", ["employee_id"], name: "index_adoptions_on_employee_id"
  add_index "adoptions", ["user_id"], name: "index_adoptions_on_user_id"

  create_table "animal_images", force: :cascade do |t|
    t.integer  "animal_id"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.date     "entry_date"
    t.text     "medical_conditions"
    t.integer  "status"
    t.integer  "animal_type"
    t.date     "date_of_birth"
    t.text     "description"
    t.string   "situation"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "images"
    t.integer  "size"
    t.integer  "gender"
    t.integer  "breed_id"
    t.boolean  "endangered"
  end

  add_index "animals", ["breed_id"], name: "index_animals_on_breed_id"

  create_table "breeds", force: :cascade do |t|
    t.string   "name"
    t.integer  "animal_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "donations", force: :cascade do |t|
    t.datetime "donation_date"
    t.integer  "donation_type"
    t.string   "description"
    t.float    "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "employee_id"
  end

  add_index "donations", ["employee_id"], name: "index_donations_on_employee_id"
  add_index "donations", ["user_id"], name: "index_donations_on_user_id"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "contact"
    t.integer  "cc"
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
    t.boolean  "admin"
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true

  create_table "requests", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "subject"
    t.integer  "status"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shelter_id"
  end

  add_index "requests", ["shelter_id"], name: "index_requests_on_shelter_id"

  create_table "shelters", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "opening_date"
    t.string   "schedule"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "address"
    t.integer  "phone"
    t.string   "email"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "cc"
    t.integer  "contact"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
    t.integer  "user_id"
  end

  add_index "volunteers", ["employee_id"], name: "index_volunteers_on_employee_id"
  add_index "volunteers", ["user_id"], name: "index_volunteers_on_user_id"

end
