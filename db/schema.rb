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

ActiveRecord::Schema.define(version: 2021_11_06_210114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "group_id"
    t.bigint "category_id"
    t.string "topic"
    t.string "status", default: "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_analyses_on_category_id"
    t.index ["group_id"], name: "index_analyses_on_group_id"
    t.index ["user_profile_id", "topic"], name: "index_analyses_on_user_profile_id_and_topic", unique: true
    t.index ["user_profile_id"], name: "index_analyses_on_user_profile_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "factors", force: :cascade do |t|
    t.bigint "analysis_id"
    t.string "ftype"
    t.string "label"
    t.string "desc"
    t.integer "x"
    t.integer "y"
    t.integer "positivity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["analysis_id"], name: "index_factors_on_analysis_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "user_profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_profile_id", "name"], name: "index_groups_on_user_profile_id_and_name", unique: true
    t.index ["user_profile_id"], name: "index_groups_on_user_profile_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "auth0_id"
    t.string "screen_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auth0_id"], name: "index_user_profiles_on_auth0_id", unique: true
  end

end
