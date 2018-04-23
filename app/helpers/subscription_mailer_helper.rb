module SubscriptionMailerHelper
  def subscribe_link(subscription, type)
    api_v1_subscribe_url(subscribe: type, confirmation_token: subscription.confirmation_token)
  end
end
