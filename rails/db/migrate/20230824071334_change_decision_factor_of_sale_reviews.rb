# frozen_string_literal: true

class ChangeDecisionFactorOfSaleReviews < ActiveRecord::Migration[7.0]
  def up
    change_column :sale_reviews, :decision_factor, :string, null: false
    change_column :raw_sale_reviews, :decision_factor, :string, null: false
  end

  def down
    change_column :sale_reviews, :decision_factor, :integer, null: false
    change_column :raw_sale_reviews, :decision_factor, :integer, null: false
  end
end
