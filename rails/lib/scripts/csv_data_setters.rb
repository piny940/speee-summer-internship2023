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
