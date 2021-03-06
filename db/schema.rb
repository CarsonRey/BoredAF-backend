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

ActiveRecord::Schema.define(version: 2019_01_02_144809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "activity"
    t.string "category"
    t.integer "participants"
    t.integer "price"
    t.string "link", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journals", force: :cascade do |t|
    t.string "date"
    t.string "participants"
    t.string "learned"
    t.string "favorite_part"
    t.string "least_favorite"
    t.boolean "would_do_again", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_journals_on_activity_id"
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "user_activities", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_id"
    t.boolean "tried", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "journaled", default: false
    t.bigint "journal_id"
    t.index ["activity_id"], name: "index_user_activities_on_activity_id"
    t.index ["journal_id"], name: "index_user_activities_on_journal_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "journals", "activities"
  add_foreign_key "journals", "users"
  add_foreign_key "user_activities", "activities"
  add_foreign_key "user_activities", "journals"
  add_foreign_key "user_activities", "users"
end
