# frozen_string_literal: true

require 'csv'

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :branch_city_assessables, dependent: :destroy
  has_many :assessable_cities, through: :branch_city_assessables, source: :city
  has_many :sale_reviews, dependent: :destroy
  has_many :raw_sale_reviews, dependent: :destroy

  def avg_service_satisfaction
    sale_reviews.average(:service_satisfaction)
  end

  def avg_sale_price_satisfaction
    sale_reviews.average(:sale_price_satisfaction)
  end

  def avg_speed_satisfaction
    sale_reviews.average(:speed_satisfaction)
  end

  def avg_satisfactions
    (avg_service_satisfaction + avg_sale_price_satisfaction + avg_speed_satisfaction) / 3.0
  end
  
  def company_branch_name
    name.present? ? "#{company.name} #{name}" : company.name
  end

  def self.create_branches_from_csv(path)
    data = CSV.read(path)[2..]
    data.each_with_index do |row, idx|
      # Companyの作成/更新
      company = Company.find_or_initialize_by(id: row[2])
      company.assign_attributes(name: row[0])
      company.save!

      # 店舗が属する市を取得
      Prefecture.find_by(name: row[6])
      city = City.find_by(name: row[7])

      branch = find_or_initialize_by(id: row[3])
      branch.assign_attributes(
        name: row[1] || '',
        company_id: row[2],
        logo_url: row[4],
        post_number: row[5],
        city_id: city.id,
        address: row[8],
        phone: row[9],
        fax_number: row[10],
        business_hours: row[11],
        regular_holiday: row[12],
        catchphrase: row[13],
        introduction: row[14]
      )
      branch.save!

      # 査定可能エリアを登録
      row[15].split(',').each do |assessable_city_id|
        branch.assessable_cities << City.find(assessable_city_id) \
          if branch.assessable_cities.pluck(:id).exclude?(assessable_city_id.to_i)
      end

      # 100行ごとに出力
      Logger.new($stdout).debug "Line #{idx} OK" if (idx % 100).zero?
    end
  end
end
