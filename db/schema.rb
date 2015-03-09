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

ActiveRecord::Schema.define(version: 20141119131312) do

  create_table "data_sources", force: true do |t|
    t.string   "name"
    t.string   "parser_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "data_source_id"
    t.text     "title"
    t.text     "content"
    t.string   "origin_url"
    t.datetime "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["data_source_id"], name: "index_posts_on_data_source_id"
  add_index "posts", ["title", "posted_at"], name: "index_posts_on_title_and_posted_at"

end
