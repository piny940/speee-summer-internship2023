class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
    @sale_reviews = SaleReview.where(branch_id: @branch.id).page(params[:page])
    @debug_placeholder = "（変数未登録）"

  end
end

