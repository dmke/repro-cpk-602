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

ActiveRecord::Schema.define(version: 2023_08_14_133340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "house_inquiries", id: false, force: :cascade do |t|
    t.bigint "inquiry_id", null: false
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_house_inquiries_on_house_id"
    t.index ["inquiry_id", "house_id"], name: "index_house_inquiries_on_inquiry_id_and_house_id", unique: true
    t.index ["inquiry_id"], name: "index_house_inquiries_on_inquiry_id"
  end

  create_table "house_owner_billings", force: :cascade do |t|
    t.bigint "inquiry_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquiry_id"], name: "index_house_owner_billings_on_inquiry_id"
    t.index ["owner_id"], name: "index_house_owner_billings_on_owner_id"
  end

  create_table "houses", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_houses_on_owner_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "house_inquiries", "houses", on_delete: :restrict
  add_foreign_key "house_inquiries", "inquiries", on_delete: :restrict
  add_foreign_key "house_owner_billings", "inquiries", on_delete: :restrict
  add_foreign_key "house_owner_billings", "owners", on_delete: :restrict
  add_foreign_key "houses", "owners", on_delete: :restrict
end
