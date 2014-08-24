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

ActiveRecord::Schema.define(version: 20140805100454) do

  create_table "balls", force: true do |t|
    t.integer  "runs"
    t.string   "how_out"
    t.string   "caught_by"
    t.string   "striker"
    t.string   "non_striker"
    t.string   "sundries_type"
    t.integer  "sundries"
    t.string   "location"
    t.integer  "delivery_id"
    t.string   "delivery_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batsmen", force: true do |t|
    t.integer  "runs"
    t.integer  "balls_faced"
    t.integer  "fours"
    t.integer  "sixes"
    t.integer  "how_out"
    t.integer  "inning_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batsmen", ["inning_id"], name: "index_batsmen_on_inning_id"

  create_table "bowlers", force: true do |t|
    t.integer  "overs"
    t.integer  "runs"
    t.integer  "wickets"
    t.integer  "wides"
    t.integer  "no_balls"
    t.integer  "maidens"
    t.integer  "inning_id"
    t.datetime "created_at"
    t.datetime "updated_at" t.string   "batsman_not_out"
    t.integer  "partnership"
    t.integer  "inning_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fall_of_wickets", ["inning_id"], name: "index_fall_of_wickets_on_inning_id"

  create_table "innings", force: true do |t|
    t.string   "batting_team"
    t.string   "bowling_team"
    t.integer  "inning_no"
    t.string   "score"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "innings", ["match_id"], name: "index_innings_on_match_id"

  create_table "matches", force: true do |t|
    t.string   "home_team"
    t.string   "away_team"
    t.string   "ground"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "competition"
    t.string   "grade"
    t.string   "umpire1"
    t.string   "umpire2"
    t.string   "scorer1"
    t.string   "scorer2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overs", force: true do |t|
    t.integer  "runs"
    t.integer  "wides"
    t.integer  "no_balls"
    t.integer  "byes"
    t.integer  "leg_byes"
    t.integer  "wickets"
    t.string   "score"
    t.integer  "match_over_id"
    t.string   "match_over_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "display_name"
    t.string   "team"
    t.integer  "cricketer_id"
    t.string   "cricketer_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["cricketer_id", "cricketer_type"], name: "index_players_on_cricketer_id_and_cricketer_type"
  end

  add_index "bowlers", ["inning_id"], name: "index_bowlers_on_inning_id"

  create_table "fall_of_wickets", force: true do |t|
    t.integer  "wicket"
    t.string   "batsman_out"
   

end
