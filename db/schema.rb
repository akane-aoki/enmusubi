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

ActiveRecord::Schema[7.0].define(version: 2023_01_18_111332) do
  create_table "efforts", force: :cascade do |t|
    t.string "body", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_efforts_on_user_id"
  end

  create_table "meets", force: :cascade do |t|
    t.date "meet_day", null: false
    t.integer "status"
    t.integer "relationship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationship_id"], name: "index_meets_on_relationship_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "body", limit: 65535
    t.date "date", null: false
    t.string "image"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "address"
    t.string "avatar"
    t.integer "relationship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["relationship_id"], name: "index_users_on_relationship_id"
  end

  add_foreign_key "efforts", "users"
  add_foreign_key "meets", "relationships"
  add_foreign_key "posts", "users"
  add_foreign_key "users", "relationships"
end
