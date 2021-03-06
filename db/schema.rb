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

ActiveRecord::Schema.define(version: 20150413225929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "report_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "text"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "comments", ["report_id"], name: "index_comments_on_report_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "description"
    t.string   "url"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "user_id"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "open",        default: true
    t.integer  "project_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "releases", ["project_id"], name: "index_releases_on_project_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "release_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "content"
    t.integer  "author_id"
    t.boolean  "accepted_by_project_owner"
  end

  add_index "reports", ["release_id"], name: "index_reports_on_release_id", using: :btree

  create_table "screenshots", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "screenshotable_id"
    t.string   "screenshotable_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "email"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "facebook"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "reports"
  add_foreign_key "comments", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "releases", "projects"
  add_foreign_key "reports", "releases"
end
