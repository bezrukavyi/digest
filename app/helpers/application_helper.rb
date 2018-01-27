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

  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end
end
