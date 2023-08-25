class SaleReviewsController < ApplicationController
  before_action :set_sale_review, only: %i[show]

  def show; end

  private

  def set_sale_review
    @sale_review = SaleReview.find(params[:id])
  end
end
