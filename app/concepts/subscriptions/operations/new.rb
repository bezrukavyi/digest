module Subscriptions
  class New < BaseOperation
    step Model(Subscription, :new)
    step Contract::Build(constant: Contracts::Create)
  end
end
