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

ActiveRecord::Schema.define(version: 20160319021612) do

  create_table "orders", force: :cascade do |t|
    t.string   "first_name",    limit: 255,                default: "",    null: false
    t.string   "last_name",     limit: 255,                default: "",    null: false
    t.string   "phone_number",  limit: 255,                default: "",    null: false
    t.string   "email",         limit: 255,                default: "",    null: false
    t.string   "address_line1", limit: 255,                default: "",    null: false
    t.string   "address_line2", limit: 255,                default: "",    null: false
    t.string   "province",      limit: 255,                default: "",    null: false
    t.string   "city",          limit: 255,                default: "",    null: false
    t.string   "postal_code",   limit: 255,                default: "",    null: false
    t.decimal  "subtotal",                  precision: 10, default: 0,     null: false
    t.float    "tax",           limit: 24,                 default: 1.13,  null: false
    t.decimal  "total",                     precision: 10, default: 0,     null: false
    t.boolean  "is_dilivery",   limit: 1,                  default: false, null: false
    t.integer  "user_id",       limit: 4,                                  null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "orders", ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "pizzas", force: :cascade do |t|
    t.string   "pizza_type",     limit: 255,                default: "", null: false
    t.decimal  "type_price",                 precision: 10, default: 0,  null: false
    t.string   "pizza_size",     limit: 255,                default: "", null: false
    t.decimal  "size_price",                 precision: 10, default: 0,  null: false
    t.string   "toppings",       limit: 255,                default: "", null: false
    t.decimal  "toppings_price",             precision: 10, default: 0,  null: false
    t.string   "crust",          limit: 255,                default: "", null: false
    t.decimal  "crust_price",                precision: 10, default: 0,  null: false
    t.decimal  "total_price",                precision: 10, default: 0,  null: false
    t.integer  "order_id",       limit: 4,                               null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "pizzas", ["order_id", "created_at"], name: "index_pizzas_on_order_id_and_created_at", using: :btree
  add_index "pizzas", ["order_id"], name: "index_pizzas_on_order_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255,                 null: false
    t.boolean  "admin",                  limit: 1,   default: false, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "orders", "users"
  add_foreign_key "pizzas", "orders"
end
