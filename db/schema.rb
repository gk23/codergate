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

ActiveRecord::Schema.define(:version => 20120710015642) do

  create_table "courses", :force => true do |t|
    t.string   "name",       :limit => 80
    t.string   "desc"
    t.string   "levels",     :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cups", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "image"
    t.string   "filter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "instructions"
    t.string   "hint"
    t.string   "default_code"
    t.string   "correct_code"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_course_ships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "lesson_id"
    t.integer  "exercise_id"
    t.decimal  "progress_completed", :precision => 3, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_cup_ships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "uid"
    t.string   "cups"
    t.integer  "exercise_num"
    t.integer  "lesson_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.boolean  "is_active",    :default => false
  end

end
