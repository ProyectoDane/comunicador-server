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

ActiveRecord::Schema.define(:version => 20140910043134) do

  create_table "cards", :force => true do |t|
    t.string "name"
  end

  create_table "exchanges", :force => true do |t|
    t.integer  "level"
    t.datetime "date"
    t.string   "pick"
    t.string   "reach"
    t.string   "drop"
    t.integer  "card_id"
    t.integer  "user_id"
    t.integer  "receiver_id"
  end

  add_index "exchanges", ["card_id"], :name => "index_exchanges_on_card_id"
  add_index "exchanges", ["receiver_id"], :name => "index_exchanges_on_receiver_id"
  add_index "exchanges", ["user_id"], :name => "index_exchanges_on_user_id"

  create_table "receivers", :force => true do |t|
    t.string  "name"
    t.string  "last_name"
    t.string  "relationship"
    t.integer "remote_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.datetime "birthdate"
    t.string   "remote_id"
  end

end
