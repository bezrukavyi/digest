class SubscribeMailService < Operators::Service
  attr_reader :subscription, :subscribe_type

  def initialize(subscription, subscribe_type)
    @subscription = subscription
    @subscribe_type = subscribe_type
  end

  def call
    subscription.confirmation_token!
    SubscriptionMailer.subscribe(subscription, subscribe_type).deliver_now
  end
end
