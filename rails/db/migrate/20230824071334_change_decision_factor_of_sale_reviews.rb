class ChangeDecisionFactorOfSaleReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :sale_reviews, :decision_factor, :string, null: false
    change_column :raw_sale_reviews, :decision_factor, :string, null: false
  end
end
