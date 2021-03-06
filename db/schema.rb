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

ActiveRecord::Schema.define(version: 20150211182215) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "job_position"
    t.string   "company"
    t.integer  "subgroup_id"
    t.integer  "group_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
  end

  add_index "clients", ["group_id"], name: "index_clients_on_group_id"
  add_index "clients", ["subgroup_id"], name: "index_clients_on_subgroup_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id"

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["client_id"], name: "index_notes_on_client_id"

  create_table "subgroups", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subgroups", ["group_id"], name: "index_subgroups_on_group_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "name"
    t.string   "surname"
    t.string   "company"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
