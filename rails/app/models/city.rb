# frozen_string_literal: true

require 'csv'

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :branches, dependent: :destroy
  has_many :branch_city_assessables, dependent: :destroy
  has_many :assessor_branches, through: :branch_city_assessables, source: :branch
  has_many :sale_reviews, dependent: :destroy # この市の物件に対する口コミ
  has_many :raw_sale_reviews, dependent: :destroy

  def self.create_cities_from_csv(path)
    data = CSV.read(path)[1..]
    data.each_with_index do |row, idx|
      city = find_or_initialize_by(id: row[0])
      city.assign_attributes(
        prefecture_id: row[1],
        name: row[2],
        name_yomi: row[3]
      )
      city.save!

      # 100行ごとに出力
      Rails.logger.debug { "Line #{idx} OK" } if (idx % 100).zero?
    end
  end
end
