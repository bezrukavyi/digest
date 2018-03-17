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

ActiveRecord::Schema.define(version: 20180304191553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_providers", force: :cascade do |t|
    t.integer "name"
    t.string "uid"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type", "resource_id"], name: "index_auth_providers_on_resource_type_and_resource_id"
  end

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
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subtitle_id"
    t.string "title"
    t.index ["issue_id"], name: "index_issue_items_on_issue_id"
    t.index ["subtitle_id"], name: "index_issue_items_on_subtitle_id"
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "mailing_list_id"
    t.datetime "release_at"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "release_number"
    t.string "slug"
    t.index ["mailing_list_id"], name: "index_issues_on_mailing_list_id"
    t.index ["slug"], name: "index_issues_on_slug"
  end

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.bigint "issue_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_item_id"], name: "index_links_on_issue_item_id"
  end

  create_table "mailing_lists", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "user_id"
    t.index ["slug"], name: "index_mailing_lists_on_slug", unique: true
    t.index ["user_id"], name: "index_mailing_lists_on_user_id"
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "name"
    t.json "tokens"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "issue_items", "issues"
  add_foreign_key "issues", "mailing_lists"
  add_foreign_key "links", "issue_items"
  add_foreign_key "mailing_lists", "users"
  add_foreign_key "subscriptions", "mailing_lists"
  add_foreign_key "subtitles", "issues"
end
