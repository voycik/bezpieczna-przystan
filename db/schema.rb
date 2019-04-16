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

ActiveRecord::Schema.define(version: 2019_04_14_165933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "type", null: false
    t.string "gender", null: false
    t.string "size", null: false
    t.string "purpose", null: false
    t.boolean "for_kids"
    t.integer "age", null: false
    t.text "general_info"
    t.date "come_date", null: false
    t.date "vaccination_date"
    t.date "sterilization_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "breed", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "image", null: false
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

end
