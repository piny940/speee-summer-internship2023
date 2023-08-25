module SaleReviewHelper
  def service_satisfaction_with_star(service_satisfaction)
    "不動産会社の対応満足度: &#9733;#{service_satisfaction.to_i}".html_safe
  end
end
