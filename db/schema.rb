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

ActiveRecord::Schema.define(version: 20150408215622) do

  create_table "casein_admin_users", force: :cascade do |t|
    t.string   "login",               limit: 255,             null: false
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.integer  "access_level",                    default: 0, null: false
    t.string   "crypted_password",    limit: 255,             null: false
    t.string   "password_salt",       limit: 255,             null: false
    t.string   "persistence_token",   limit: 255
    t.string   "single_access_token", limit: 255
    t.string   "perishable_token",    limit: 255
    t.integer  "login_count",                     default: 0, null: false
    t.integer  "failed_login_count",              default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",    limit: 255
    t.string   "last_login_ip",       limit: 255
    t.string   "time_zone",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cruises", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255
    t.text     "content"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cruises", ["venue_id"], name: "index_cruises_on_venue_id"

  create_table "destinations", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "slug",          limit: 255
    t.text     "content"
    t.string   "location",      limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "international"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255
    t.text     "content"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "venue_id"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "destination_id"
    t.text     "departing_location", limit: 255
    t.datetime "departing_at"
    t.text     "arriving_location",  limit: 255
    t.datetime "arriving_at"
    t.string   "flight_number",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arriving_airport",   limit: 255
    t.string   "departing_airport",  limit: 255
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "menu_items", force: :cascade do |t|
    t.string   "href",         limit: 255
    t.string   "icon",         limit: 255
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value",        limit: 255
    t.integer  "page_id"
    t.boolean  "blank_target"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255
    t.text     "content"
    t.string   "status",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"

  create_table "port_of_calls", force: :cascade do |t|
    t.integer  "cruise_id"
    t.integer  "port_id"
    t.datetime "arrives_at"
    t.datetime "departs_at"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "port_of_calls", ["cruise_id"], name: "index_port_of_calls_on_cruise_id"
  add_index "port_of_calls", ["port_id"], name: "index_port_of_calls_on_port_id"

  create_table "ports", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.text     "content"
    t.string   "location",   limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
