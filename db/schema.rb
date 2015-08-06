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

ActiveRecord::Schema.define(version: 20150805153044) do

  create_table "admin_menu_items", force: :cascade do |t|
    t.string   "href"
    t.string   "icon"
    t.integer  "position"
    t.string   "text"
    t.integer  "page_id"
    t.boolean  "blank_target"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "admin_menu_items", ["page_id"], name: "index_admin_menu_items_on_page_id"

  create_table "attractions", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "casinos", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "content"
    t.integer  "destination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "code"
  end

  add_index "casinos", ["destination_id"], name: "index_casinos_on_destination_id"

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "international"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.integer  "venue_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "type"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["venue_id"], name: "index_events_on_venue_id"

  create_table "flights", force: :cascade do |t|
    t.integer  "casino_id"
    t.text     "departing_location"
    t.datetime "departing_at"
    t.datetime "arriving_at"
    t.string   "departing_airport"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "flights", ["casino_id"], name: "index_flights_on_casino_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.string   "status"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "front_page"
    t.boolean  "container_layout", default: true
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "title"
    t.text     "caption"
    t.string   "alt"
    t.text     "description"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image"
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"

  create_table "port_of_calls", force: :cascade do |t|
    t.datetime "arrives_at"
    t.datetime "departs_at"
    t.integer  "position"
    t.integer  "event_id"
    t.integer  "port_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "port_of_calls", ["event_id"], name: "index_port_of_calls_on_event_id"
  add_index "port_of_calls", ["port_id"], name: "index_port_of_calls_on_port_id"

  create_table "ports", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "location"
    t.text     "content"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.text     "content"
    t.boolean  "approved",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "venue_attractions", force: :cascade do |t|
    t.integer  "venue_id"
    t.integer  "attraction_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "venue_attractions", ["attraction_id"], name: "index_venue_attractions_on_attraction_id"
  add_index "venue_attractions", ["venue_id"], name: "index_venue_attractions_on_venue_id"

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "type"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
