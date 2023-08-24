class ChangeBooleanColumnsOfSaleReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :sale_reviews, :discount
    add_column :sale_reviews, :discounted, :boolean, null: false

    remove_column :sale_review_raws, :discount
    add_column :sale_review_raws, :discounted, :boolean, null: false
  end
end
