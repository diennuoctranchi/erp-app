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

ActiveRecord::Schema.define(version: 20211102063351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "erp_editor_uploads", id: :serial, force: :cascade do |t|
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "erp_electrical_blogs", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.text "content"
    t.string "title"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "tags"
    t.string "alias"
    t.text "cache_search"
    t.integer "custom_order"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_electrical_blogs_on_creator_id"
  end

  create_table "erp_electrical_diaries", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "custom_order"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_electrical_diaries_on_creator_id"
  end

  create_table "erp_electrical_faqs", force: :cascade do |t|
    t.text "question"
    t.text "reply"
    t.integer "custom_order"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_electrical_faqs_on_creator_id"
  end

  create_table "erp_electrical_service_categories", force: :cascade do |t|
    t.string "image"
    t.string "icon"
    t.string "name"
    t.string "title"
    t.text "content"
    t.integer "parent_id"
    t.string "short_description"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "tags"
    t.integer "custom_order"
    t.text "cache_search"
    t.string "alias"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_electrical_service_categories_on_creator_id"
  end

  create_table "erp_electrical_services", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "title"
    t.text "content"
    t.text "quotation"
    t.string "short_description"
    t.boolean "is_best_choice", default: false
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "tags"
    t.integer "custom_order"
    t.text "cache_search"
    t.string "alias"
    t.bigint "service_category_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_erp_electrical_services_on_creator_id"
    t.index ["service_category_id"], name: "index_erp_electrical_services_on_service_category_id"
  end

  create_table "erp_user_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "permissions"
    t.bigint "creator_id"
    t.boolean "active", default: true
    t.index ["creator_id"], name: "index_erp_user_groups_on_creator_id"
  end

  create_table "erp_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "provider"
    t.string "uid"
    t.boolean "backend_access", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar"
    t.string "timezone"
    t.boolean "active", default: false
    t.integer "creator_id"
    t.text "permissions"
    t.string "confirmation_token"
    t.datetime "confirmed_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "confirmation_sent_at"
    t.bigint "user_group_id"
    t.string "address"
    t.text "data"
    t.text "cache_search"
    t.index ["confirmation_token"], name: "index_erp_users_on_confirmation_token", unique: true
    t.index ["creator_id"], name: "index_erp_users_on_creator_id"
    t.index ["email"], name: "index_erp_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_erp_users_on_reset_password_token", unique: true
    t.index ["user_group_id"], name: "index_erp_users_on_user_group_id"
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

end
