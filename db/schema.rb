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

ActiveRecord::Schema.define(version: 20150416224939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "gender"
    t.string   "sexual_preference"
    t.string   "religion"
    t.date     "birthdate"
    t.text     "bio"
    t.text     "embarrassing_moment"
    t.boolean  "smoke"
    t.string   "linkedin_url"
    t.string   "facebook_url"
    t.string   "pf_image_1"
    t.string   "pf_image_2"
    t.string   "pf_image_3"
    t.string   "pf_image_4"
    t.string   "pf_image_5"
    t.integer  "main_profile_image"
    t.integer  "parent_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "playdates", force: :cascade do |t|
    t.integer  "initiator_id"
    t.integer  "recipient_id"
    t.integer  "experience_id"
    t.integer  "movie_id"
    t.string   "note"
    t.boolean  "recipient_accepted",  default: false
    t.boolean  "initiator_confirmed", default: false
    t.boolean  "recipient_confirmed", default: false
    t.boolean  "initiator_paid",      default: false
    t.boolean  "recipient_paid",      default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
