FactoryBot.define do
  factory :prefecture do
    sequence(:name) { |n| "都道府県#{n}" }
    # created_at { '2020-11-07 09:28:28 +0900' }
    # updated_at { '2021-11-07 09:28:28 +0900' }
  end
end