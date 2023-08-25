class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
    @sale_reviews = @branch.sale_reviews.page(params[:page])
  end
end

