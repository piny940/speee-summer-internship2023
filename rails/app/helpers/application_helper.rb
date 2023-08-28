# frozen_string_literal: true

module ApplicationHelper
  ## xx万円という形の文字列にする
  def format_price(price)
    "#{(price / 10_000).to_fs(:delimited)}万円"
  end

  ## Y年m月という形にする
  def year_month_description(datetime)
    datetime.strftime("%Y年#{datetime.month}月")
  end
end
