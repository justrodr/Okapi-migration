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

ActiveRecord::Schema.define(version: 20190327003354) do

  create_table "properties", force: :cascade do |t|
    t.integer  "user"
    t.string   "prop_name"
    t.string   "tenant_name"
    t.string   "tenant_email"
    t.string   "tenant_phone"
    t.string   "address"
    t.integer  "frequency"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "last_delivered"
  end

  create_table "table_properties", force: :cascade do |t|
    t.string "user"
    t.string "property_name"
    t.string "tenant_name"
    t.string "tenant_email"
    t.string "tenant_number"
    t.string "address"
    t.string "frequency"
    t.string "last_change_date"
    t.string "next_change_date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
