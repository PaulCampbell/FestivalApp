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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101106125501) do

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "weblink"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "stage_id"
    t.integer  "band_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day"
    t.datetime "starttime"
    t.datetime "endtime"
  end

  add_index "events", ["band_id"], :name => "index_events_on_band_id"
  add_index "events", ["stage_id"], :name => "index_events_on_stage_id"

  create_table "festivals", :force => true do |t|
    t.string   "name"
    t.date     "startdate"
    t.date     "enddate"
    t.text     "description"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", :force => true do |t|
    t.integer  "festival_id"
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stages", ["festival_id"], :name => "index_stages_on_festival_id"

  create_table "user_festivals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "festival_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "passwordsalt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.boolean  "admin"
  end

end
