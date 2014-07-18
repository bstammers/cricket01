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

ActiveRecord::Schema.define(version: 20140718065622) do

  create_table "balls", force: true do |t|
    t.integer  "runs"
    t.string   "how_out"
    t.string   "caught_by"
    t.string   "striker"
    t.string   "non_striker"
    t.string   "sundries_type"
    t.integer  "sundries_amt"
    t.string   "shot_location"
    t.integer  "bowler_id"
    t.integer  "over_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batsman_id"
  end

  add_index "balls", ["batsman_id"], name: "index_balls_on_batsman_id"
  add_index "balls", ["bowler_id"], name: "index_balls_on_bowler_id"
  add_index "balls", ["over_id"], name: "index_balls_on_over_id"

  create_table "batsmen", force: true do |t|
    t.string   "name"
    t.integer  "balls_faced"
    t.integer  "fours"
    t.integer  "sixes"
    t.integer  "inning_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batsmen", ["inning_id"], name: "index_batsmen_on_inning_id"

  create_table "bowlers", force: true do |t|
    t.string   "name"
    t.integer  "overs"
    t.integer  "runs"
    t.integer  "wickets"
    t.integer  "wides"
    t.integer  "no_balls"
    t.integer  "maidens"
    t.integer  "inning_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bowlers", ["inning_id"], name: "index_bowlers_on_inning_id"

  create_table "fows", force: true do |t|
    t.integer  "wicket"
    t.string   "batsman_out"
    t.string   "batsman_not_out"
    t.integer  "partnership"
    t.integer  "inning_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fows", ["inning_id"], name: "index_fows_on_inning_id"

  create_table "innings", force: true do |t|
    t.string   "batting_team"
    t.string   "bowling_team"
    t.integer  "innings_no"
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
    t.string   "umpire1"
    t.string   "umpire2"
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
    t.integer  "bowler_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "overs", ["bowler_id"], name: "index_overs_on_bowler_id"

end
