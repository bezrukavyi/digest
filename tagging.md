# Trailblaizer Guid

## Operations

```ruby
class MailingList::Create < Trailblazer::Operation
  step :model
  step :build
  step :validate
  step :persist

  def model(env, params:, **)
    env[:model] = MailingList.new
  end

  def build(env, params:, **)
    env[:contract] = MailingList::Contract::Create.new(env[:model])
  end

  def validate(env, params:, **)
    env[:contract].validate(params)
  end

  def persist(env, params:, **)
    env[:contract].save
  end

  # or with macros

  step Model(::MailingList, :new) # result[:model]
  step Contract::Build(constant: MailingList::Contract::Create) # result['contract.default']
  step Contract::Validate()
  step Contract::Persist()
end
```

## Contract | Reform

```ruby
require 'reform/form/validation/unique_validator' # for 'unique: true'

module MailingList::Contract
  class Create < Reform::Form
    property :name
    property :slug
    property :description

    validates :name, :description, :slug, presence: true
    validates :slug, unique: true
  end
end
```
