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

ActiveRecord::Schema.define(version: 20180103202413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "issue_items", force: :cascade do |t|
    t.bigint "issue_id"
    t.string "source", null: false
    t.string "link", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_issue_items_on_issue_id"
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "mailing_list_id"
    t.datetime "release_at"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "release_number"
    t.index ["mailing_list_id"], name: "index_issues_on_mailing_list_id"
  end

  create_table "mailing_lists", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_mailing_lists_on_slug", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email", null: false
    t.bigint "mailing_list_id"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.index ["email", "mailing_list_id"], name: "index_subscriptions_on_email_and_mailing_list_id", unique: true
    t.index ["mailing_list_id"], name: "index_subscriptions_on_mailing_list_id"
  end

  create_table "subtitles", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_subtitles_on_issue_id"
  end

  add_foreign_key "issue_items", "issues"
  add_foreign_key "issues", "mailing_lists"
  add_foreign_key "subscriptions", "mailing_lists"
  add_foreign_key "subtitles", "issues"
end
