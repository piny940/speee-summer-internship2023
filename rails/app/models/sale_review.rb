# frozen_string_literal: true

require 'csv'

class SaleReview < ApplicationRecord # rubocop:disable Metrics/ClassLength
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
    data.each_with_index do |row, idx|
      review_data = csv_row_to_hash(row)

      # 店舗・氏名・不動産会社の対応満足度の理由の3つが全て同じ口コミは同一の口コミとみなして更新を行う
      sale_review = find_or_initialize_by(
        branch_id: row[1],
        name: row[2],
        service_satisfaction_reason: row[29]
      )
      sale_review.assign_attributes(review_data)
      sale_review.save!

      # RawSaleReviewの作成も同時に行う
      raw_sale_review = RawSaleReview.find_or_initialize_by(
        branch_id: row[1],
        name: row[2],
        service_satisfaction_reason: row[29]
      )
      review_data.delete(:publishment) # 公開/非公開はRawSaleReviewでは考えない
      raw_sale_review.assign_attributes(review_data)
      raw_sale_review.save!

      # 100行ごとに出力
      Logger.new($stdout).debug "Line #{idx} OK" if (idx % 100).zero?
    end
  end

  GENDERS = {
    '男性' => 'male',
    '女性' => 'female',
    'その他・不明' => 'other'
  }.freeze
  PROPERTY_TYPES = {
    'マンション' => 'apartment',
    '戸建て' => 'house',
    '土地' => 'land'
  }.freeze
  PREVIOUS_EXPERIENCES = {
    '初めて' => 'first',
    '2回目' => 'second',
    '3回以上' => 'more'
  }.freeze
  DISCOUNTEDS = {
    '1' => true,
    '0' => false
  }.freeze
  AGENCY_TYPES = {
    '1' => 'senzoku_sennin',
    '2' => 'sennin',
    '3' => 'ippan',
    '4' => 'other'
  }.freeze
  SALE_REASONS = {
    '1' => 'moving',
    '2' => 'inheritance',
    '3' => 'job_change',
    '4' => 'divorce',
    '5' => 'assets_management',
    '6' => 'financial',
    '99' => 'other'
  }.freeze
  def self.csv_row_to_hash(row)
    Branch.find(row[1])
    Prefecture.find_by(name: row[5])
    city = City.find_by(name: row[6])

    {
      publishment: 'published', # CSVから入ってきたデータはデフォルトで公開する
      name: row[2],
      gender: GENDERS[row[3]],
      age: row[4],
      city_id: city.id,
      address: row[7],
      property_type: PROPERTY_TYPES[row[8]],
      previous_experience: PREVIOUS_EXPERIENCES[row[9]],
      begin_consideration_period: row[10],
      assessment_request_period: row[11],
      begin_sale_period: row[12],
      sale_period: row[13],
      transfer_period: row[14],
      speed_satisfaction: row[15],
      assessed_price: row[16],
      begin_sale_price: row[17],
      discounted: DISCOUNTEDS[row[18]],
      discounted_period_from_begin_sale: row[19] || -1,
      discount_amount: row[20] || 0,
      final_sale_price: row[21],
      sale_price_satisfaction: row[22],
      agency_type: AGENCY_TYPES[row[23]],
      title: row[24],
      sale_reason: SALE_REASONS[row[25]],
      concerns: row[26],
      decision_factor: row[27],
      service_satisfaction: row[28],
      service_satisfaction_reason: row[29],
      advice_for_next: row[30],
      complaint: row[31] || ''
    }
  end
end
