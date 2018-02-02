module SubscriptionMailerHelper
  def subscribe_link(subscription, type)
    subscribe_url(subscribe: type, confirmation_token: subscription.confirmation_token)
  end
end
