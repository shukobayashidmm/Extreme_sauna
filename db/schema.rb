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

ActiveRecord::Schema.define(version: 2023_05_13_034650) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rating_rates", force: :cascade do |t|
    t.decimal "value", precision: 11, scale: 2, default: "0.0"
    t.string "author_type", limit: 10, null: false
    t.integer "author_id", null: false
    t.string "resource_type", limit: 10, null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type", limit: 10
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id", "resource_type", "resource_id", "scopeable_type", "scopeable_id"], name: "index_rating_rates_on_author_and_resource_and_scopeable", unique: true
    t.index ["author_type", "author_id"], name: "index_rating_rates_on_author_type_and_author_id"
    t.index ["resource_type", "resource_id"], name: "index_rating_rates_on_resource_type_and_resource_id"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_rates_on_scopeable_type_and_scopeable_id"
  end

  create_table "rating_ratings", force: :cascade do |t|
    t.decimal "average", precision: 11, scale: 2, default: "0.0"
    t.decimal "estimate", precision: 11, scale: 2, default: "0.0"
    t.integer "sum", default: 0
    t.integer "total", default: 0
    t.string "resource_type", limit: 10, null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type", limit: 10
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type", "resource_id", "scopeable_type", "scopeable_id"], name: "index_rating_rating_on_resource_and_scopeable", unique: true
    t.index ["resource_type", "resource_id"], name: "index_rating_ratings_on_resource_type_and_resource_id"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_ratings_on_scopeable_type_and_scopeable_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sauna_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "star"
  end

  create_table "saunas", force: :cascade do |t|
    t.string "name", null: false
    t.string "price", null: false
    t.string "business_hour", null: false
    t.float "room_temperature", null: false
    t.float "water_temperature", null: false
    t.integer "prefecture", null: false
    t.string "address", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "postcode", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.string "birthday", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
