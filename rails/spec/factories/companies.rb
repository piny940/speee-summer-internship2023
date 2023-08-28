# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "ベテすま不動産#{n}" }
    created_at { '2020-11-07 09:28:28 +0900' }
    updated_at { '2021-11-07 09:28:28 +0900' }
  end
end
