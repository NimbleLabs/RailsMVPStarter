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

ActiveRecord::Schema.define(version: 2021_11_04_175405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupon_codes", force: :cascade do |t|
    t.string "code"
    t.string "offer"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coupon_codes_on_user_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "last4"
    t.string "brand"
    t.integer "exp_month"
    t.integer "exp_year"
    t.string "country"
    t.string "stripe_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "email"
    t.bigint "user_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_leads_on_slug"
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "nimble_hub_data_sources", force: :cascade do |t|
    t.string "name"
    t.string "uuid"
    t.bigint "user_id", null: false
    t.string "source_type"
    t.jsonb "metadata", default: "{}"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_nimble_hub_data_sources_on_slug"
    t.index ["user_id"], name: "index_nimble_hub_data_sources_on_user_id"
  end

  create_table "nimble_hub_integrations", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.integer "token_expires_in"
    t.datetime "token_expires_at"
    t.jsonb "auth_info", default: "{}"
    t.jsonb "metadata", default: "{}"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_nimble_hub_integrations_on_slug"
    t.index ["user_id"], name: "index_nimble_hub_integrations_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.string "description"
    t.string "status"
    t.string "stripe_id"
    t.string "stripe_customer_id"
    t.integer "created"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "name"
    t.string "slug"
    t.integer "role", default: 0
    t.string "auth_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "image_url"
    t.string "stripe_customer_id"
    t.string "subscription_id"
    t.string "subscription_status"
    t.string "coupon_code"
    t.index ["auth_token"], name: "index_users_on_auth_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug"
  end

  add_foreign_key "credit_cards", "users"
  add_foreign_key "leads", "users"
  add_foreign_key "nimble_hub_data_sources", "users"
  add_foreign_key "nimble_hub_integrations", "users"
  add_foreign_key "payments", "users"
end
