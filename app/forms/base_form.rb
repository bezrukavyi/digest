require 'reform/form/active_model/validations'

Reform::Form.class_eval do
  include Reform::Form::ActiveModel::Validations
end

class BaseForm < Reform::Form
  def submit(params)
    save if validate(params)
  end
end
