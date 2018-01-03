class SubscriptionConfirmEmail
  def self.call(subscription_id)
    subscription = Subscription.find(subscription_id)
    SubscriptionMailer.confirmation(subscription).deliver_now
  end
end
