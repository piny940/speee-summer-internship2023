# frozen_string_literal: true

namespace :branch do
  task read_data_from_csv: :environment do
    Branch.create_branches_from_csv('lib/assets/branches.csv')
  end
end
