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

ActiveRecord::Schema.define(:version => 20131214210214) do

  create_table "access_grants", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.integer  "uid"
    t.string   "omniauth_token"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "access_grants", ["provider", "uid"], :name => "index_access_grants_on_provider_and_uid"
  add_index "access_grants", ["user_id"], :name => "index_access_grants_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.text     "description"
    t.string   "profile_url"
    t.string   "avatar_url"
    t.decimal  "target_amount", :precision => 10, :scale => 0, :default => 0
    t.decimal  "raised_amount", :precision => 10, :scale => 0, :default => 0
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "photo_url"
    t.integer  "run_count",                                     :default => 0
    t.decimal  "total_distance", :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "total_donated",  :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

end
