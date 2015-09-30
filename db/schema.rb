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

ActiveRecord::Schema.define(version: 20150930064007) do

  create_table "flags", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "show_users",   default: true
    t.boolean  "show_profile", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["user_id"], name: "index_flags_on_user_id"

  create_table "githubs", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "githubs", ["user_id"], name: "index_githubs_on_user_id"

  create_table "islands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "github_id"
  end

  add_index "languages", ["github_id"], name: "index_languages_on_github_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.text     "bio",        default: "初めまして、よろしくお願いします。"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "repositories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "private"
    t.string   "svn_url"
    t.string   "size"
    t.string   "description"
    t.integer  "github_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "repositories", ["github_id"], name: "index_repositories_on_github_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "github_token"
    t.string   "avatar_url"
    t.string   "nickname"
    t.string   "name"
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

end
