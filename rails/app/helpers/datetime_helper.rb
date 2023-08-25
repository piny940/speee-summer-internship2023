module DatetimeHelper
  def year_month_description(datetime)
    datetime.strftime("%Y年#{datetime.month}月")
  end
end
