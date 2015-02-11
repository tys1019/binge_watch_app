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

ActiveRecord::Schema.define(version: 20150211165305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string  "name"
    t.integer "number"
    t.integer "length"
    t.integer "season_id"
    t.integer "show_id"
    t.boolean "watched",   default: false, null: false
  end

  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id", using: :btree
  add_index "episodes", ["show_id"], name: "index_episodes_on_show_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists_shows", id: false, force: :cascade do |t|
    t.integer "list_id"
    t.integer "show_id"
  end

  add_index "lists_shows", ["list_id"], name: "index_lists_shows_on_list_id", using: :btree
  add_index "lists_shows", ["show_id"], name: "index_lists_shows_on_show_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.string  "number"
    t.integer "show_id"
    t.boolean "watched", default: false, null: false
  end

  add_index "seasons", ["show_id"], name: "index_seasons_on_show_id", using: :btree

  create_table "shows", force: :cascade do |t|
    t.string  "name"
    t.string  "artwork"
    t.text    "description"
    t.integer "list_id"
  end

  add_index "shows", ["list_id"], name: "index_shows_on_list_id", using: :btree

  create_table "vieweds", force: :cascade do |t|
    t.integer "list_id"
    t.integer "episode_id"
    t.boolean "viewed",     default: false, null: false
  end

  add_index "vieweds", ["episode_id"], name: "index_vieweds_on_episode_id", using: :btree
  add_index "vieweds", ["list_id"], name: "index_vieweds_on_list_id", using: :btree

  add_foreign_key "episodes", "seasons"
  add_foreign_key "episodes", "shows"
  add_foreign_key "seasons", "shows"
  add_foreign_key "shows", "lists"
  add_foreign_key "vieweds", "episodes"
  add_foreign_key "vieweds", "lists"
end
