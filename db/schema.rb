# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_18_085259) do
  create_table "buy_items", charset: "utf8mb4", force: :cascade do |t|
    t.integer "product_id"
    t.integer "item_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.bigint "user_id"
    t.index ["item_id"], name: "index_buy_items_on_item_id"
    t.index ["user_id"], name: "index_buy_items_on_user_id"
  end

  create_table "carts", charset: "utf8mb4", force: :cascade do |t|
    t.integer "product_id"
    t.integer "item_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_carts_on_item_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "contacts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", charset: "utf8mb4", force: :cascade do |t|
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_favorites_on_item_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.text "product_name"
    t.text "arrival_source"
    t.text "manufactuer"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", charset: "utf8mb4", force: :cascade do |t|
    t.string "email"
    t.integer "tel"
    t.string "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_logs_on_item_id"
  end

  create_table "shippings", charset: "utf8mb4", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.integer "login_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
  end

  add_foreign_key "buy_items", "items"
  add_foreign_key "buy_items", "users"
  add_foreign_key "carts", "items"
  add_foreign_key "carts", "users"
  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users"
  add_foreign_key "logs", "items"
end
