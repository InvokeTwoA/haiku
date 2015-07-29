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

ActiveRecord::Schema.define(version: 20150729181006) do

  create_table "comments", force: :cascade do |t|
    t.integer  "haiku_set_id", limit: 4,     null: false
    t.integer  "user_id",      limit: 4
    t.text     "name",         limit: 65535
    t.text     "body",         limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "goods", force: :cascade do |t|
    t.integer  "value",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
    t.integer  "word1",      limit: 4
    t.integer  "word2",      limit: 4
    t.integer  "word3",      limit: 4
  end

  create_table "haiku_sets", force: :cascade do |t|
    t.string   "token",        limit: 255
    t.integer  "word1",        limit: 4
    t.integer  "word2",        limit: 4
    t.integer  "word3",        limit: 4
    t.integer  "pv",           limit: 4
    t.integer  "comments_num", limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "haiku_sets", ["word1", "word2", "word3"], name: "index_haiku_sets_on_word1_and_word2_and_word3", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                limit: 255
    t.string   "type",                limit: 255
    t.string   "admin_type",          limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  create_table "words", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number",              limit: 4
    t.string   "text",                limit: 255
    t.string   "type",                limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

end
