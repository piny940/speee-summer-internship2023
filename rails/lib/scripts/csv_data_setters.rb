require 'csv'

def set_prefectures_from_csv(path)
  data = CSV.read(path)[1..]
  p '=== start ==='
  data.each do |row|
    prefecture = Prefecture.find_or_initialize_by(id: row[0])
    prefecture.assign_attributes(name: row[1])
    prefecture.save!
  end
  p '=== end ==='
end
