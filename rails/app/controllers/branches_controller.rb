# frozen_string_literal: true

class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
    @sale_reviews = @branch.sale_reviews.page(params[:page])
    @score_range = 1..5
    @scores = {
      service: @branch.avg_service_satisfaction,
      speed: @branch.avg_speed_satisfaction,
      price: @branch.avg_sale_price_satisfaction
    }
  end
end
