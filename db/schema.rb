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

ActiveRecord::Schema.define(version: 2018_10_21_015127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competition_teams", force: :cascade do |t|
    t.integer "competition_id"
    t.integer "team_id"
    t.integer "points", default: 0
    t.integer "goal_difference", default: 0
    t.integer "place", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "tournament_format", default: 0
    t.integer "status", default: 0
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_teams", force: :cascade do |t|
    t.integer "group_id"
    t.integer "team_id"
    t.integer "points", default: 0
    t.integer "goal_difference", default: 0
    t.integer "place", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer "competition_id"
    t.integer "order", default: 0
    t.string "name"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "competition_id"
    t.integer "group_id"
    t.integer "home_team_id"
    t.integer "visitor_team_id"
    t.integer "home_team_score", default: 0
    t.integer "visitor_team_score", default: 0
    t.integer "winner", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "status", default: 0
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
