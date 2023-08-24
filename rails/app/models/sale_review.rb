# frozen_string_literal: true

class SaleReview < ApplicationRecord
  belongs_to :branch
  belongs_to :city

  enum publishment: {
    published: 0,
    unpublished: 1
  }

  enum gender: {
    male: 0,
    female: 1,
    other: 99
  }, _prefix: true

  enum property_type: {
    apartment: 0,
    house: 1,
    land: 2
  }, _prefix: true

  enum previous_experience: {
    first: 0, # 初めて
    second: 1, # 2回目
    more: 99 # 3回以上
  }, _prefix: true

  enum agency_type: {
    senzoku_sennin: 0, # 専属専任媒介契約
    sennin: 1, # 専任媒介契約
    ippan: 2, # 一般媒介契約
    other: 99 # 分からない
  }, _prefix: true

  enum sale_reason: {
    moving: 0, # 住み替え
    inheritance: 1, # 相続
    job_change: 2, # 転勤、転職
    divorce: 3, # 離婚
    assets_management: 4, # 資産整理
    financial: 5, # 金銭的な理由
    other: 99 # その他
  }, _prefix: true

  def self.create_sale_reviews_from_csv(path)
    data = CSV.read(path)[2..]
    data.each do |row|
      branch = Branch.find(row[1])
      prefecture = Prefecture.find_by(name: row[5])
      city = City.find_by(name: row[6])
      gender = case row[3]
        when '男性' then 'male'
        when '女性' then 'female'
        else 'other'
      property_type = case row[8]
        when 'マンション' then 'apartment'
        when '戸建て' then 'house'
        when '土地' then 'land'
      previous_experience = case row[9]
        when '初めて' then 'first'
        when '2回目' then 'second'
        when '3回以上' then 'more'
      discounted = case row[18]
        when 1 then true
        when 0 then false
      agency_type = case row[23]
        when 1 then 'senzoku_sennin'
        when 2 then 'sennin'
        when 3 then 'ippan'
        when 4 then 'other'
      sale_reason = case row[25]
        when 1 then 'moving'
        when 2 then 'inheritance'
        when 3 then 'job_change'
        when 4 then 'divorce'
        when 5 then 'assets_management'
        when 6 then 'financial'
        else 'other'

      # 店舗・氏名・不動産会社の対応満足度の理由の3つが全て同じ口コミは同一の口コミとみなして更新を行う
      sale_review = find_or_initialize_by(
        branch_id: row[1],
        name: row[2],
        service_satisfaction_reason: row[29]
      )
      sale_review.assign_attributes(
        publishment: 'published', # CSVから取り込んだ口コミはデフォルトで公開とする
        name: row[2],
        gender:,
        age: row[4],
        city_id: city.id,
        address: row[7],
        property_type:,
        previous_experience:,
        begin_consideration_period: row[10],
        assessment_request_period: row[11],
        begin_sale_period: row[12],
        sale_period: row[13],
        transfer_period: row[14],
        speed_satisfaction: row[15],
        assessed_price: row[16],
        begin_sale_price: row[17],
        discounted:,
        discounted_period_from_begin_sale: row[19],
        discount_amount: row[20],
        final_sale_price: row[21],
        sale_price_satisfaction: row[22],
        agency_type:,
        title: row[24],
        sale_reason:,
        concerns: row[26],
        decision_factor: row[27],
        service_satisfaction: row[28],
        service_satisfaction_reason: row[29],
        advice_for_next: row[30],
        complaint: row[31]
      )
    end
  end
end
