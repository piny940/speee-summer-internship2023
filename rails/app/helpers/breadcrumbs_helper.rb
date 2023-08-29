# frozen_string_literal: true

module BreadcrumbsHelper
  def breadcrumbs(controller_name, action_name)
    current_page_name = "#{controller_name}##{action_name}"
    list = breadcrumbs_tree.find { |b_list| b_list.include?(current_page_name) }
    list && list[0..list.index(current_page_name)].map { |name| breadcrumbs_url(name) }
  end

  private

  def breadcrumbs_tree
    [
      ['homes#show', 'branches#show', 'sale_reviews#show'],
      ['homes#show', 'branches#show', 'assessments#new', 'assessments#success'],
    ]
  end

  def breadcrumbs_url(name)
    case name
    when 'homes#show'
      { name: 'トップページ', url: root_path }
    when 'branches#show'
      { name: "#{@branch.company.name}#{@branch.name}", url: branch_path(@branch) }
    when 'sale_reviews#show'
      { name: "#{@sale_review.title[..10]}...", url: sale_review_path(@sale_review)}
    when 'assessments#new'
      { name: '査定依頼フォーム', url: new_branch_assessment_path(@branch)}
    when 'assessments#success'
      { name: '査定依頼完了', url: branch_assessments_success_path(@branch)}
    else
      raise "breadcrumbs_url に #{name} が定義されていません！"
    end
  end
end
