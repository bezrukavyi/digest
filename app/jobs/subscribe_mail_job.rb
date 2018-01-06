class SubscribeMailJob
  include SuckerPunch::Job

  def perform(subscription_id, subscribe_type)
    subscription = Subscription.find(subscription_id)
    SubscribeMailService.call(subscription, subscribe_type)
  end
end
