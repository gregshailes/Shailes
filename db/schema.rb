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

ActiveRecord::Schema.define(version: 2023_01_16_155225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_subscriptions", id: :serial, force: :cascade do |t|
    t.string "target_url"
    t.string "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boris_cam_images", id: :serial, force: :cascade do |t|
    t.string "filename"
    t.binary "filedata"
    t.string "filetype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "comment"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diary_entries", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_diary_entries_on_user_id"
  end

  create_table "finances_accounts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "opening_balance_pence", default: 0, null: false
    t.string "opening_balance_currency", default: "GBP", null: false
    t.boolean "primary", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reconciled_balance_pence"
    t.string "reconciled_balance_currency", default: "GBP", null: false
    t.index ["user_id"], name: "index_finances_accounts_on_user_id"
  end

  create_table "finances_bills", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.string "description", null: false
    t.integer "amount_pence", default: 0, null: false
    t.string "amount_currency", default: "GBP", null: false
    t.string "frequency", null: false
    t.integer "interval", null: false
    t.date "next_due_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["account_id"], name: "index_finances_bills_on_account_id"
  end

  create_table "finances_pots", force: :cascade do |t|
    t.bigint "account_id"
    t.integer "amount_pence", default: 0, null: false
    t.string "amount_currency", default: "GBP", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_finances_pots_on_account_id"
  end

  create_table "finances_transactions", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.string "description"
    t.integer "amount_pence", default: 0
    t.string "amount_currency", default: "GBP", null: false
    t.boolean "reconciled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "transaction_date"
    t.integer "to_account_id"
    t.index ["account_id"], name: "index_finances_transactions_on_account_id"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "imageable_type"
    t.integer "imageable_id"
    t.string "filename"
    t.binary "filedata"
    t.string "filetype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_areas", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "menu_id"
    t.integer "index"
    t.string "caption"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_menu_items_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "title"
    t.bigint "menu_area_id"
    t.integer "index"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_area_id"], name: "index_menus_on_menu_area_id"
  end

  create_table "ratrace_posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_ratrace_posts_on_user_id"
  end

  create_table "ride_log_bikes", id: :serial, force: :cascade do |t|
    t.string "name", default: "New Bike"
    t.string "details"
    t.boolean "current", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ride_log_images", id: :serial, force: :cascade do |t|
    t.string "title"
    t.binary "image"
    t.binary "thumbnail"
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_ride_log_images_on_imageable_type_and_imageable_id"
  end

  create_table "ride_log_rides", id: :serial, force: :cascade do |t|
    t.integer "ride_log_bike_id"
    t.string "name", default: "New Ride"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ride_log_bike_id"], name: "index_ride_log_rides_on_ride_log_bike_id"
  end

  create_table "task_sessions", force: :cascade do |t|
    t.bigint "task_id"
    t.datetime "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_task_sessions_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_owner_type"
    t.bigint "task_owner_id"
    t.string "name"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_owner_type", "task_owner_id"], name: "index_tasks_on_task_owner"
  end

  create_table "users", id: :serial, force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "administrator"
    t.string "first_name"
    t.string "last_name"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
