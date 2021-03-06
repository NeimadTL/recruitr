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

ActiveRecord::Schema.define(version: 2020_02_25_200808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interviewee_interviewer_matchings", force: :cascade do |t|
    t.integer "interviewee_id", null: false
    t.integer "interviewer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interviewee_id", "interviewer_id"], name: "interviewee_interviewer_index", unique: true
    t.index ["interviewee_id"], name: "index_interviewee_interviewer_matchings_on_interviewee_id"
    t.index ["interviewer_id"], name: "index_interviewee_interviewer_matchings_on_interviewer_id"
  end

  create_table "position_skill_taggings", force: :cascade do |t|
    t.integer "position_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position_id", "skill_id"], name: "position_skill_index", unique: true
    t.index ["position_id"], name: "index_position_skill_taggings_on_position_id"
    t.index ["skill_id"], name: "index_position_skill_taggings_on_skill_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title", default: "Undifined", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description", default: "", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer "code", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scorecards", force: :cascade do |t|
    t.integer "experience"
    t.integer "dynamism"
    t.integer "interest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", default: "Undifined", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_position_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position_id"], name: "index_user_position_requests_on_position_id"
    t.index ["user_id", "position_id"], name: "user_position_index", unique: true
    t.index ["user_id"], name: "index_user_position_requests_on_user_id"
  end

  create_table "user_skill_taggings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_user_skill_taggings_on_skill_id"
    t.index ["user_id", "skill_id"], name: "user_skill_index", unique: true
    t.index ["user_id"], name: "index_user_skill_taggings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role_id", default: 3, null: false
    t.string "firstname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.string "city", default: "", null: false
    t.string "country", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
