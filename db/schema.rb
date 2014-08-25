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

ActiveRecord::Schema.define(version: 20140824232344) do

  create_table "balls", force: true do |t|
    t.integer  "runs"
    t.string   "how_out"
    t.string   "caught_by"
    t.string   "striker"
    t.string   "non_striker"
    t.integer  "sundries"
    t.string   "sundries_type"
    t.string   "location"
    t.integer  "over_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "balls", ["over_id"], name: "index_balls_on_over_id"

  create_table "batsmen", force: true do |t|
    t.integer  "runs"
    t.integer  "balls_faced"
    t.integer  "fours"
    t.integer  "sixes"
    t.string   "how_out"
    t.string   "ball_history"
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
    t.datetime "updated_at"
  end

  add_index "bowlers", ["inning_id"], name: "index_bowlers_on_inning_id"

  create_table "fall_of_wickets", force: true do |t|
    t.integer  "wicket"
    t.string   "batsman_out"
    t.string   "batsman_not_out"
    t.integer  "partnership"
    t.integer  "inning_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fall_of_wickets", ["inning_id"], name: "index_fall_of_wickets_on_inning_id"

  create_table "innings", force: true do |t|
    t.integer  "inning_no"
    t.string   "batting_team"
    t.string   "bowling_team"
    t.string   "score"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "innings", ["match_id"], name: "index_innings_on_match_id"

  create_table "match_overs", force: true do |t|
    t.integer  "runs"
    t.integer  "wides"
    t.integer  "no_balls"
    t.integer  "byes"
    t.integer  "leg_byes"
    t.integer  "wickets"
    t.string   "score"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "match_overs", ["match_id"], name: "index_match_overs_on_match_id"

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
    t.integer  "bowler_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "overs", ["bowler_id"], name: "index_overs_on_bowler_id"

end
