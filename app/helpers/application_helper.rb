module ApplicationHelper
  def pretty_date(date)
    date.to_s :month_day_comma_year
  end
end
