# frozen_string_literal: true

class ChangeTableNameOfSaleReviewRaws < ActiveRecord::Migration[7.0]
  def change
    rename_table :sale_review_raws, :raw_sale_reviews
  end
end
