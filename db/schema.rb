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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130105050654) do

  create_table "activities", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "duration"
    t.integer "order"
    t.integer "party_id"
  end

  add_index "activities", ["party_id"], :name => "index_activities_on_party_id"

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "location"
  end

end
