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

ActiveRecord::Schema.define(version: 20190306023831) do

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
  #example dummy Property.new(user: "hunter", prop_name: "wisconsin", tenant_name: "john", tenant_email: "john@d.com", tenant_phone: "11111", address: "123 wis av", frequency: 1,last_delivered: "Sun, 01 Jan 2012 00:00:00 +0300")       
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hashed_password"
    t.integer  "prop_index"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
