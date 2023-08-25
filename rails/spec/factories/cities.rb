FactoryBot.define do
  factory :city do
    association :prefecture

    sequence(:name) { |n| "市区町村#{n}" }
    sequence(:name_yomi) { |n| "市区町村_よみ#{n}" }
    # created_at { '2020-11-07 09:28:28 +0900' }
    # updated_at { '2021-11-07 09:28:28 +0900' }
  end
end
