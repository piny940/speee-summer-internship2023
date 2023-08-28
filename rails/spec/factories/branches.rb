# frozen_string_literal: true

FactoryBot.define do
  factory :branch do
    association :company # belongs_to company
    association :city

    # sequence(:company_id) { |n| "#{n}" }
    # sequence(:city_id) { |n| "#{n}" }

    sequence(:name) { |n| "ベテすま不動産#{n}" }
    logo_url { 'https://foodslink.jp/syokuzaihyakka/syun/fruit/abricotto/anzu21s.jpg' }
    post_number { '123-4567' }
    address { '東京都港区六本木３丁目２−１ 住友不動産六本木グランドタワー 35F' }
    phone { '000-0000-0000' }
    fax_number { '03-000-0000' }
    business_hours { '平日9:00～18:00' }
    regular_holiday { '水曜日、祝日、GW、他' }
    catchphrase { '解き尽くす。未来を引きよせる。' }
    introduction { '解き尽くす。Speeeは、「未来」を読み解き、「今」を解く。隠れた課題を掘り起こし、新しい技術と発想で、新しい解法を次々と生み出していく。' }
    # created_at { '2020-11-07 09:28:28 +0900' }
    # updated_at { '2021-11-07 09:28:28 +0900' }
  end
end
