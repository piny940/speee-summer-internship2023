require './lib/scripts/csv_data_setters'

namespace :prefecture do
  task read_data_from_csv: :environment do
    set_prefectures_from_csv('lib/assets/prefectures.csv')
  end
end
