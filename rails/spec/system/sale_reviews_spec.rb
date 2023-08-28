# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SaleReviews' do
  let(:all_filled_sale_review) { create(:sale_review) }
  let(:lacked_sale_review) { create(:sale_review, complaint: '', concerns: '') }

  describe '/sale_reviews/:id' do
    it '項目が正しく表示されることを確認' do
      visit sale_review_path(all_filled_sale_review)
      expect(all('.description').count).to eq 6 # sale_reviewのdescriptionの個数
    end

    it '内容が空の項目は表示されない' do
      visit sale_review_path(lacked_sale_review)
      expect(all('.description').count).to eq 4 # sale_reviewのdescriptionの個数
    end
  end
end
