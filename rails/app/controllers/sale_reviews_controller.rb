# frozen_string_literal: true

class SaleReviewsController < ApplicationController
  before_action :set_sale_review, only: %i[show]
  before_action :require_branch, only: %i[show]

  def show; end

  private

  def set_sale_review
    @sale_review = SaleReview.find(params[:id])
  end

  def require_branch
    @branch = @sale_review.branch
  end
end
