# frozen_string_literal: true

require './lib/scripts/csv_data_setters'

namespace :city do
  task read_data_from_csv: :environment do
    create_cities_from_csv('lib/assets/cities.csv')
  end
end
