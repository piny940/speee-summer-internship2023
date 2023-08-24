# frozen_string_literal: true

class ChangeBooleanColumnsOfSaleReviews < ActiveRecord::Migration[7.0]
  def up
    remove_column :sale_reviews, :discount
    add_column :sale_reviews, :discounted, :boolean, null: false, default: false, comment: '値下げしたかどうか'

    remove_column :sale_review_raws, :discount
    add_column :sale_review_raws, :discounted, :boolean, null: false, default: false, comment: '値下げしたかどうか'
  end

  def down
    add_column :sale_reviews, :discount, :integer, null: false, comment: '値下げしたかどうか'
    remove_column :sale_reviews, :discounted

    add_column :sale_review_raws, :discount, :integer, null: false, comment: '値下げしたかどうか'
    remove_column :sale_review_raws, :discounted
  end
end
