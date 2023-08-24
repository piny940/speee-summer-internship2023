# frozen_string_literal: true

namespace :city do
  task read_data_from_csv: :environment do
    City.create_cities_from_csv('lib/assets/cities.csv')
  end
end
