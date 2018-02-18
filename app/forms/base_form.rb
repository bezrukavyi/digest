require 'reform/form/validation/unique_validator'

class BaseForm < Reform::Form
  include Reform::Form::ActiveModel::ModelReflections
end
