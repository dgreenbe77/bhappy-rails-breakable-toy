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

ActiveRecord::Schema.define(version: 20140402150252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "infos", force: true do |t|
    t.float    "health"
    t.float    "wealth"
    t.float    "culture"
    t.float    "location"
    t.float    "spirituality"
    t.float    "relationship"
    t.float    "activity"
    t.float    "passion"
    t.float    "satisfaction"
    t.float    "self_view"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "smile"
    t.string   "image"
  end

  create_table "questions", force: true do |t|
    t.string   "healthq",       null: false
    t.string   "wealthq",       null: false
    t.string   "cultureq",      null: false
    t.string   "locationq",     null: false
    t.string   "spiritualityq", null: false
    t.string   "relationshipq", null: false
    t.string   "activityq",     null: false
    t.string   "passionq",      null: false
    t.string   "satisfactionq", null: false
    t.string   "self_viewq",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["activityq"], name: "index_questions_on_activityq", unique: true, using: :btree
  add_index "questions", ["cultureq"], name: "index_questions_on_cultureq", unique: true, using: :btree
  add_index "questions", ["healthq"], name: "index_questions_on_healthq", unique: true, using: :btree
  add_index "questions", ["locationq"], name: "index_questions_on_locationq", unique: true, using: :btree
  add_index "questions", ["passionq"], name: "index_questions_on_passionq", unique: true, using: :btree
  add_index "questions", ["relationshipq"], name: "index_questions_on_relationshipq", unique: true, using: :btree
  add_index "questions", ["satisfactionq"], name: "index_questions_on_satisfactionq", unique: true, using: :btree
  add_index "questions", ["self_viewq"], name: "index_questions_on_self_viewq", unique: true, using: :btree
  add_index "questions", ["spiritualityq"], name: "index_questions_on_spiritualityq", unique: true, using: :btree
  add_index "questions", ["wealthq"], name: "index_questions_on_wealthq", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "role",                   default: "member", null: false
    t.integer  "info_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
