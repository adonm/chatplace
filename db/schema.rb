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

ActiveRecord::Schema.define(version: 20140526210917) do

  create_table "channels", force: true do |t|
    t.string   "owner_email"
    t.string   "name"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["latitude"], :name => "index_channels_on_latitude"
    t.index ["longitude"], :name => "index_channels_on_longitude"
    t.index ["name"], :name => "index_channels_on_name", :unique => true
    t.index ["owner_email"], :name => "index_channels_on_owner_email"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.text     "body"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["channel_id"], :name => "fk__messages_channel_id"
    t.index ["user_id"], :name => "fk__messages_user_id"
    t.foreign_key ["channel_id"], "channels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_messages_channel_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_messages_user_id"
  end

end