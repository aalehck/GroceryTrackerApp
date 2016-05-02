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

ActiveRecord::Schema.define(version: 20160426181543) do

  create_table "budgets", force: :cascade do |t|
    t.decimal  "budget_total", default: 0.0
    t.decimal  "budget_used",  default: 0.0
    t.string   "period"
    t.date     "start",        default: '2016-05-02'
    t.integer  "profile_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "budgets", ["profile_id"], name: "index_budgets_on_profile_id"

  create_table "grocery_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "grocery_lists", ["user_id"], name: "index_grocery_lists_on_user_id"

  create_table "inventories", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inventories", ["user_id"], name: "index_inventories_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount",        default: 0.0
    t.string   "unit"
    t.decimal  "cost"
    t.integer  "calories"
    t.decimal  "carbs"
    t.decimal  "sugar"
    t.decimal  "cholesterol"
    t.decimal  "sodium"
    t.decimal  "protein"
    t.decimal  "b1"
    t.decimal  "selenium"
    t.decimal  "folate"
    t.decimal  "manganese"
    t.decimal  "b3"
    t.decimal  "b2"
    t.decimal  "iron"
    t.decimal  "phosphorus"
    t.decimal  "fiber"
    t.decimal  "copper"
    t.decimal  "magnesium"
    t.decimal  "zinc"
    t.decimal  "b5"
    t.decimal  "potassium"
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "items", ["itemable_type", "itemable_id"], name: "index_items_on_itemable_type_and_itemable_id"

  create_table "profiles", force: :cascade do |t|
    t.text     "essentials"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.integer  "time"
    t.text     "information"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
