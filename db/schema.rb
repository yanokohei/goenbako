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

ActiveRecord::Schema.define(version: 2022_06_02_073734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "access_token", default: "", null: false
    t.string "access_token_secret", default: "", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "letters", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.integer "receiver_id", null: false
    t.string "past"
    t.string "current"
    t.string "future"
    t.string "expect"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sender_id"], name: "index_letters_on_sender_id"
  end

  create_table "share_images", force: :cascade do |t|
    t.bigint "letter_id", null: false
    t.string "topic", null: false
    t.text "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["letter_id"], name: "index_share_images_on_letter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "twitter_id", null: false
    t.string "name", null: false
    t.string "image"
    t.text "introduce"
    t.integer "role", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["twitter_id"], name: "index_users_on_twitter_id", unique: true
  end

  add_foreign_key "letters", "users", column: "sender_id"
end
