# frozen_string_literal: true

require 'csv'

def create_prefectures_from_csv(path)
  data = CSV.read(path)[1..]
  data.each do |row|
    prefecture = Prefecture.find_or_initialize_by(id: row[0])
    prefecture.assign_attributes(name: row[1])
    prefecture.save!
  end
end

def create_cities_from_csv(path)
  data = CSV.read(path)[1..]
  data.each_with_index do |row, idx|
    city = City.find_or_initialize_by(id: row[0])
    city.assign_attributes(
      prefecture_id: row[1],
      name: row[2],
      name_yomi: row[3],
    )
    city.save!

    # 100行ごとに出力
    if idx % 100 == 0
      p "Line #{idx} OK"
    end
  end
end
