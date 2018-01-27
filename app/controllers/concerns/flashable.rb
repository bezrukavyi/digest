module Flashable
  extend ActiveSupport::Concern

  def inject_flash_error(entity)
    flash_errors = flash["#{entity.class.name.downcase}_errors".to_sym]
    return if flash_errors.blank? || !flash_errors.is_a?(Hash)
    flash_errors.each do |key, errors|
      [errors].flatten.each { |error| entity.errors.add(key, error) }
    end
  end

  def flash_render(template, flash_messages = {})
    flash_messages.each { |type, message| flash.now[type] = message }
    render template
  end
end
