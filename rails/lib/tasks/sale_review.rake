# frozen_string_literal: true

namespace :sale_review do
  task read_data_from_csv: :environment do
    SaleReview.create_sale_reviews_from_csv('lib/assets/sale_reviews.csv')
  end
end
