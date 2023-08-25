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

ActiveRecord::Schema[7.0].define(version: 2023_08_24_075915) do
  create_table "assessment_users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "first_name", null: false, comment: "名"
    t.string "last_name", null: false, comment: "姓"
    t.string "first_name_kana", null: false, comment: "名フリガナ"
    t.string "last_name_kana", null: false, comment: "姓フリガナ"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "tel", null: false, comment: "電話番号"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "assessment_user_id", null: false, comment: "assessment_userのidへの外部キー"
    t.bigint "branch_id", null: false, comment: "branchのidへの外部キー"
    t.bigint "city_id", null: false, comment: "cityのidへの外部キー"
    t.string "property_address", null: false, comment: "対象物件の住所"
    t.integer "property_type", null: false, comment: "象物件の物件種別"
    t.float "property_exclusive_area", null: false, comment: "対象物件の専有面積"
    t.float "property_land_area", null: false, comment: "対象物件の土地面積"
    t.float "property_building_area", null: false, comment: "対象物件の建物面積"
    t.integer "property_building_area_unit", null: false, comment: "建物面積の単位"
    t.float "property_floor_area", null: false, comment: "対象物件の延床面積"
    t.integer "property_room_plan", null: false, comment: "対象物件の間取り"
    t.integer "property_constructed_year", null: false, comment: "対象物件の築年数(竣工年)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_user_id"], name: "index_assessments_on_assessment_user_id"
    t.index ["branch_id"], name: "index_assessments_on_branch_id"
    t.index ["city_id"], name: "index_assessments_on_city_id"
  end

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
    t.string "name_yomi", null: false
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

  create_table "raw_sale_reviews", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.string "name", null: false
    t.integer "gender", null: false
    t.integer "age", null: false
    t.bigint "city_id", null: false
    t.string "address", null: false
    t.integer "property_type", null: false, comment: "物件種別"
    t.integer "previous_experience", null: false, comment: "売却回数"
    t.datetime "begin_consideration_period", null: false, comment: "売却検討時期"
    t.datetime "assessment_request_period", null: false, comment: "査定依頼時期"
    t.datetime "begin_sale_period", null: false, comment: "売出時期"
    t.datetime "sale_period", null: false, comment: "売却時期"
    t.datetime "transfer_period", null: false, comment: "引渡時期"
    t.integer "speed_satisfaction", null: false, comment: "売却スピードの満足度"
    t.integer "assessed_price", null: false, comment: "査定価格"
    t.integer "begin_sale_price", null: false, comment: "販売価格"
    t.integer "discounted_period_from_begin_sale", default: -1, null: false, comment: "売り出してから何ヶ月後に値下げしたか"
    t.integer "discount_amount", default: 0, null: false, comment: "値下げ価格"
    t.integer "final_sale_price", null: false, comment: "成約価格"
    t.integer "sale_price_satisfaction", null: false, comment: "売却価格の満足度"
    t.integer "agency_type", null: false, comment: "媒介契約の形態"
    t.string "title", null: false, comment: "見出し"
    t.integer "sale_reason", null: false, comment: "売却理由"
    t.text "concerns", null: false, comment: "売却時に不安だったこと"
    t.string "decision_factor", null: false, comment: "この会社に決めた理由"
    t.integer "service_satisfaction", null: false, comment: "不動産会社の対応満足度"
    t.text "service_satisfaction_reason", null: false, comment: "不動産会社の対応満足度の理由"
    t.text "advice_for_next", null: false, comment: "今後売却する人へのアドバイス"
    t.text "complaint", null: false, comment: "不動産会社に改善してほしい点"
    t.string "concerns", null: false, comment: "売却時に不安だったこと"
    t.string "decision_factor", null: false, comment: "この会社に決めた理由"
    t.integer "service_satisfaction", null: false, comment: "不動産会社の対応満足度"
    t.string "service_satisfaction_reason", null: false, comment: "不動産会社の対応満足度の理由"
    t.string "advice_for_next", null: false, comment: "今後売却する人へのアドバイス"
    t.string "complaint", default: "", null: false, comment: "不動産会社に改善してほしい点"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "discounted", default: false, null: false, comment: "値下げしたかどうか"
    t.index ["branch_id"], name: "index_raw_sale_reviews_on_branch_id"
    t.index ["city_id"], name: "index_raw_sale_reviews_on_city_id"
  end

  create_table "sale_reviews", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "publishment", comment: "公開状況"
    t.bigint "branch_id", null: false
    t.string "name", null: false
    t.integer "gender", null: false
    t.integer "age", null: false
    t.bigint "city_id", null: false
    t.string "address", null: false
    t.integer "property_type", null: false, comment: "物件種別"
    t.integer "previous_experience", null: false, comment: "売却回数"
    t.datetime "begin_consideration_period", null: false, comment: "売却検討時期"
    t.datetime "assessment_request_period", null: false, comment: "査定依頼時期"
    t.datetime "begin_sale_period", null: false, comment: "売出時期"
    t.datetime "sale_period", null: false, comment: "売却時期"
    t.datetime "transfer_period", null: false, comment: "引渡時期"
    t.integer "speed_satisfaction", null: false, comment: "売却スピードの満足度"
    t.integer "assessed_price", null: false, comment: "査定価格"
    t.integer "begin_sale_price", null: false, comment: "販売価格"
    t.integer "discounted_period_from_begin_sale", default: -1, null: false, comment: "売り出してから何ヶ月後に値下げしたか"
    t.integer "discount_amount", default: 0, null: false, comment: "値下げ価格"
    t.integer "final_sale_price", null: false, comment: "成約価格"
    t.integer "sale_price_satisfaction", null: false, comment: "売却価格の満足度"
    t.integer "agency_type", null: false, comment: "媒介契約の形態"
    t.string "title", null: false, comment: "見出し"
    t.integer "sale_reason", null: false, comment: "売却理由"
    t.text "concerns", null: false, comment: "売却時に不安だったこと"
    t.string "concerns", null: false, comment: "売却時に不安だったこと"
    t.string "decision_factor", null: false, comment: "この会社に決めた理由"
    t.integer "service_satisfaction", null: false, comment: "不動産会社の対応満足度"
    t.text "service_satisfaction_reason", null: false, comment: "不動産会社の対応満足度の理由"
    t.text "advice_for_next", null: false, comment: "今後売却する人へのアドバイス"
    t.text "complaint", null: false, comment: "不動産会社に改善してほしい点"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "discounted", default: false, null: false, comment: "値下げしたかどうか"
    t.index ["branch_id"], name: "index_sale_reviews_on_branch_id"
    t.index ["city_id"], name: "index_sale_reviews_on_city_id"
  end

  add_foreign_key "assessments", "assessment_users"
  add_foreign_key "assessments", "branches"
  add_foreign_key "assessments", "cities"
  add_foreign_key "branch_city_assessables", "branches"
  add_foreign_key "branch_city_assessables", "cities"
  add_foreign_key "branches", "cities"
  add_foreign_key "branches", "companies"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "raw_sale_reviews", "branches"
  add_foreign_key "raw_sale_reviews", "cities"
  add_foreign_key "sale_reviews", "branches"
  add_foreign_key "sale_reviews", "cities"
end
