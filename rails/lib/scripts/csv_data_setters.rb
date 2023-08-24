def set_prefectures_from_csv(path)
  data = CSV.read(path)[1..]
  data.each do |row|
    pref = Prefecture.find_or_initialize_by(id: row['id'])
    pref.update_attributes!(name: row['name'])
  end
end
