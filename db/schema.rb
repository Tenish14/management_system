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

ActiveRecord::Schema[7.0].define(version: 2022_03_29_065929) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "quantity_stock"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "company_id"
    t.decimal "cost"
    t.decimal "profit"
    t.string "item_code"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["company_id"], name: "index_items_on_company_id"
  end

  create_table "location_items", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "outlet_price"
    t.decimal "outlet_cost"
    t.decimal "outlet_profit"
    t.index ["item_id"], name: "index_location_items_on_item_id"
    t.index ["location_id"], name: "index_location_items_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address_1"
    t.string "address_2"
    t.integer "postcode"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.string "location_code"
    t.index ["company_id"], name: "index_locations_on_company_id"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.string "authority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_permission_id"
    t.index ["role_permission_id"], name: "index_roles_on_role_permission_id"
  end

  create_table "supplier_items", force: :cascade do |t|
    t.bigint "supplier_id"
    t.bigint "item_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_supplier_items_on_item_id"
    t.index ["location_id"], name: "index_supplier_items_on_location_id"
    t.index ["supplier_id"], name: "index_supplier_items_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_suppliers_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "role_id"
    t.integer "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "items", "categories"
  add_foreign_key "items", "companies"
  add_foreign_key "locations", "companies"
  add_foreign_key "roles", "role_permissions"
  add_foreign_key "suppliers", "companies"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "roles"
end
