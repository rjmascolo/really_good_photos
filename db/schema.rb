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

ActiveRecord::Schema.define(version: 20171113183150) do

  create_table "categories", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
<<<<<<< HEAD
    t.string "name"
    t.integer "photo_id"
    t.string "location"
    t.float "longitude"
    t.float "latitude"
    t.integer "category_id"
=======
    t.integer "photo_id"
    t.string "name"
    t.string "description"
    t.float "longitude"
    t.float "latitude"
    t.string "taken_at"
    t.string "category"
    t.string "location"
    t.string "rating"
    t.string "image_url"
>>>>>>> 486029c3046f2116f26228c0a850e3480b736ccd
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "home_location"
<<<<<<< HEAD
    t.float "latitude", default: 1.0
    t.float "longitude", default: 1.0
=======
>>>>>>> 486029c3046f2116f26228c0a850e3480b736ccd
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usersphotos", force: :cascade do |t|
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end