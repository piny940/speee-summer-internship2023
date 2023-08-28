# frozen_string_literal: true

FactoryBot.define do
  factory :sale_review do
    association :branch
    association :city

    sequence(:name) { |n| "市区町村#{n}" }

    gender { 'male' }
    age { 20 }
    address { '港区' }
    property_type { 'apartment' }
    previous_experience { 'first' }
    begin_consideration_period { '2000-01-11' }
    assessment_request_period { '2001-01-11' }
    begin_sale_period { '2002-01-11' }
    sale_period { '2003-01-11' }
    transfer_period { '2004-01-11' }
    speed_satisfaction { 5 }
    assessed_price { 10_000 }
    begin_sale_price { 20_000 }
    final_sale_price { 30_000 }
    sale_price_satisfaction { 1 }
    agency_type { 'sennin' }
    title { 'タイトル' }
    sale_reason { 'moving' }
    concerns { '心配' }
    decision_factor { '人柄' }
    service_satisfaction { 4 }
    service_satisfaction_reason { '満足度の理由' }
    advice_for_next { 'がんば！' }
    complaint { 'ここ改善したほうがいいよ' }
  end
end
