# frozen_string_literal: true

module ApplicationHelper
  def format_price(price)
    "#{(price / 10000).to_fs(:delimited)}万円"
  end 
end
