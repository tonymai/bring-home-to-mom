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

ActiveRecord::Schema.define(version: 20150421205130) do

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

  create_table "children_interests", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "interest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "children_values", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "venue"
    t.string   "address"
    t.string   "desc_summary"
    t.string   "desc_note_1"
    t.string   "desc_note_2"
    t.string   "desc_note_3"
    t.integer  "price_per_person", default: 0
    t.string   "image"
    t.datetime "experience_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "playdate_id"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["parent_id"], name: "index_messages_on_parent_id", using: :btree
  add_index "messages", ["playdate_id"], name: "index_messages_on_playdate_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "venue"
    t.string   "address"
    t.string   "title"
    t.string   "description"
    t.string   "director"
    t.integer  "rating"
    t.integer  "price_per_person", default: 15
    t.string   "image"
    t.datetime "movie_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "parents", ["email"], name: "index_parents_on_email", unique: true, using: :btree
  add_index "parents", ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true, using: :btree

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

  add_index "playdates", ["initiator_id"], name: "index_playdates_on_initiator_id", using: :btree
  add_index "playdates", ["recipient_id"], name: "index_playdates_on_recipient_id", using: :btree

  create_table "values", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
