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

ActiveRecord::Schema.define(version: 20150822160459) do

  create_table "dashboards", force: true do |t|
    t.integer  "user_id"
    t.boolean  "is_users",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dashboards", ["user_id"], name: "index_dashboards_on_user_id"

  create_table "flags", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["user_id"], name: "index_flags_on_user_id"

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "profiles", force: true do |t|
    t.text     "bio",        default: "初めまして、よろしくお願いします。"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "users", force: true do |t|
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
    t.integer  "profile_id"
    t.integer  "notification_id"
    t.integer  "dashboard_id"
    t.integer  "flag_id"
  end

  add_index "users", ["dashboard_id"], name: "index_users_on_dashboard_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["flag_id"], name: "index_users_on_flag_id"
  add_index "users", ["notification_id"], name: "index_users_on_notification_id"
  add_index "users", ["profile_id"], name: "index_users_on_profile_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
