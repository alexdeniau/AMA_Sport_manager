# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_28_124259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "earnings", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.integer "forecast_amount"
    t.integer "real_amount"
    t.bigint "tournament_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category", default: "Prize money"
    t.index ["tournament_id"], name: "index_earnings_on_tournament_id"
    t.index ["user_id"], name: "index_earnings_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.date "date"
    t.integer "amount"
    t.bigint "tournament_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "done", default: false
    t.index ["tournament_id"], name: "index_expenses_on_tournament_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.jsonb "prize_money"
    t.string "surface"
    t.string "category"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "participants"
    t.string "official_link"
    t.text "description"
    t.string "last_winner"
    t.float "latitude"
    t.float "longitude"
    t.integer "total_prize_money"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "nationality"
    t.integer "ranking"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "earnings", "tournaments"
  add_foreign_key "earnings", "users"
  add_foreign_key "expenses", "tournaments"
  add_foreign_key "expenses", "users"
end
