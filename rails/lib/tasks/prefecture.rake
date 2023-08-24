# frozen_string_literal: true

namespace :prefecture do
  task read_data_from_csv: :environment do
    Prefecture.create_prefectures_from_csv('lib/assets/prefectures.csv')
  end
end
