class SubscribeSubscriptionService < Operators::Service
  attr_reader :subscription, :params, :subscribe_type

  SUBSCTIBE_TYPES = %i[enable disable]

  def initialize(subscription, params)
    @subscription = subscription
    @params = params
    @subscribe_type = params[:subscribe]&.to_sym
  end

  def call
    return failure unless valid?

    return failure unless subscribe

    subscribe_type = subscription.active? ? :disable : :enable
    SubscribeMailJob.perform_async(subscription.id, subscribe_type)

    success
  end

  private

  def subscribe
    return subscription.activate if subscribe_type == :enable
    return subscription.cancel if subscribe_type == :disable
  end

  def valid?
    subscription && subscribe_type && SUBSCTIBE_TYPES.include?(subscribe_type)
  end
end
