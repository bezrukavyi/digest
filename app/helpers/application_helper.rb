module ApplicationHelper
  def pretty_date(date)
    date.to_s :month_day_comma_year
  end

  def flash_class(type)
    case type.to_sym
      when :notice then 'alert alert-primary'
      when :success then 'alert alert-success'
      when :error then 'alert alert-danger'
      when :alert then 'alert alert-warning'
    end
  end
end
