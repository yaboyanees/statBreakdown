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

ActiveRecord::Schema.define(version: 20150811220606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stats", force: :cascade do |t|
    t.integer  "year"
    t.integer  "week"
    t.integer  "GameMean"
    t.integer  "Season2dateMean"
    t.integer  "CurrentMeanTrend"
    t.integer  "OFFGameMean"
    t.integer  "Season2dateOFFMean"
    t.integer  "CurrentOFFMeanTrend"
    t.integer  "DEFGameMean"
    t.integer  "Season2dateDEFMean"
    t.integer  "CurrentDEFMeanTrend"
    t.string   "win"
    t.integer  "team1pts"
    t.integer  "team2pts"
    t.integer  "diff"
    t.string   "team1"
    t.string   "team2"
    t.string   "short1"
    t.string   "short2"
    t.string   "url"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
