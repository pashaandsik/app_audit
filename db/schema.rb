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

ActiveRecord::Schema.define(:version => 20131021174143) do

  create_table "cars", :force => true do |t|
    t.string   "name"
    t.string   "object_subdivisiod"
    t.date     "date_of_commissioning"
    t.date     "date_warranty"
    t.integer  "warranty_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "ch_all"
    t.integer  "km_all"
  end

  add_index "cars", ["warranty_id"], :name => "index_cars_on_warranty_id"

  create_table "details", :force => true do |t|
    t.integer  "car_id"
    t.integer  "warranty_id"
    t.integer  "time_de_job"
    t.integer  "time_de_all"
    t.integer  "time_de_warranty"
    t.integer  "km_de_job"
    t.integer  "km_de_all"
    t.integer  "km_de_warranty"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "ancestry"
    t.string   "name_det"
    t.integer  "job_id"
  end

  add_index "details", ["ancestry"], :name => "index_details_on_ancestry"
  add_index "details", ["car_id"], :name => "index_details_on_car_id"
  add_index "details", ["job_id"], :name => "index_details_on_job_id"
  add_index "details", ["warranty_id"], :name => "index_details_on_warranty_id"

  create_table "jobs", :force => true do |t|
    t.boolean  "repair_job"
    t.boolean  "to"
    t.integer  "km_n"
    t.integer  "m_ch"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "car_id"
    t.boolean  "season_bool"
  end

  add_index "jobs", ["car_id"], :name => "index_jobs_on_car_id"

  create_table "repairs", :force => true do |t|
    t.string   "cause"
    t.integer  "car_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "detail_id"
    t.boolean  "replacement"
    t.integer  "job_id"
  end

  add_index "repairs", ["car_id"], :name => "index_repairs_on_car_id"
  add_index "repairs", ["detail_id"], :name => "index_repairs_on_detail_id"
  add_index "repairs", ["job_id"], :name => "index_repairs_on_job_id"

  create_table "services", :force => true do |t|
    t.integer  "car_id"
    t.integer  "amount"
    t.date     "season_sumer"
    t.date     "season_winter"
    t.date     "time_to"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "services", ["car_id"], :name => "index_services_on_car_id"

  create_table "warranties", :force => true do |t|
    t.string   "name"
    t.string   "adds"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
