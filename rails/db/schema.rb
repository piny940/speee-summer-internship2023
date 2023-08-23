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

ActiveRecord::Schema[7.0].define(version: 2023_08_23_092905) do
  create_table "branch_city_assessables", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branch_city_assessables_on_branch_id"
    t.index ["city_id"], name: "index_branch_city_assessables_on_city_id"
  end

  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id", null: false
    t.string "logo_url", null: false
    t.string "post_number", default: "", null: false
    t.bigint "city_id", null: false
    t.string "address", null: false
    t.string "phone", default: "", null: false
    t.string "fax_number", default: "", null: false
    t.string "business_hours", default: "", null: false
    t.string "regular_holiday", default: "", null: false
    t.string "catchphrase", null: false
    t.string "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_branches_on_city_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "yomi", null: false
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_review_raws", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.string "name", null: false
    t.integer "gender", null: false
    t.integer "age", null: false
    t.bigint "city_id", null: false
    t.string "address", null: false
    t.integer "property_type", null: false
    t.integer "previous_experience", null: false
    t.datetime "begin_consideration_period", null: false
    t.datetime "assessment_request_period", null: false
    t.datetime "begin_sale_period", null: false
    t.datetime "sale_period", null: false
    t.datetime "transfer_period", null: false
    t.integer "speed_satisfaction", null: false
    t.integer "assessed_price", null: false
    t.integer "begin_sale_price", null: false
    t.integer "discount", null: false
    t.integer "discounted_period_from_begin_sale", default: -1, null: false
    t.integer "discount_amount", default: 0, null: false
    t.integer "final_sale_price", null: false
    t.integer "sale_price_satisfaction", null: false
    t.integer "agency_type", null: false
    t.string "title", null: false
    t.integer "sale_reason", null: false
    t.integer "concerns", null: false
    t.integer "decision_factor", null: false
    t.integer "service_satisfaction", null: false
    t.string "service_satisfaction_reason", null: false
    t.string "advice_for_next", null: false
    t.string "complaint", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_sale_review_raws_on_branch_id"
    t.index ["city_id"], name: "index_sale_review_raws_on_city_id"
  end

  create_table "sale_reviews", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "publishment"
    t.bigint "branch_id", null: false
    t.string "name", null: false
    t.integer "gender", null: false
    t.integer "age", null: false
    t.bigint "city_id", null: false
    t.string "address", null: false
    t.integer "property_type", null: false
    t.integer "previous_experience", null: false
    t.datetime "begin_consideration_period", null: false
    t.datetime "assessment_request_period", null: false
    t.datetime "begin_sale_period", null: false
    t.datetime "sale_period", null: false
    t.datetime "transfer_period", null: false
    t.integer "speed_satisfaction", null: false
    t.integer "assessed_price", null: false
    t.integer "begin_sale_price", null: false
    t.integer "discount", null: false
    t.integer "discounted_period_from_begin_sale", default: -1, null: false
    t.integer "discount_amount", default: 0, null: false
    t.integer "final_sale_price", null: false
    t.integer "sale_price_satisfaction", null: false
    t.integer "agency_type", null: false
    t.string "title", null: false
    t.integer "sale_reason", null: false
    t.integer "concerns", null: false
    t.integer "decision_factor", null: false
    t.integer "service_satisfaction", null: false
    t.string "service_satisfaction_reason", null: false
    t.string "advice_for_next", null: false
    t.string "complaint", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_sale_reviews_on_branch_id"
    t.index ["city_id"], name: "index_sale_reviews_on_city_id"
  end

  add_foreign_key "branch_city_assessables", "branches"
  add_foreign_key "branch_city_assessables", "cities"
  add_foreign_key "branches", "cities"
  add_foreign_key "branches", "companies"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "sale_review_raws", "branches"
  add_foreign_key "sale_review_raws", "cities"
  add_foreign_key "sale_reviews", "branches"
  add_foreign_key "sale_reviews", "cities"
end
