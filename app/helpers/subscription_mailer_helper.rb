module SubscriptionMailerHelper
  def subscribe_link(subscription, type)
    link_to type.to_s.humanize, subscribe_url(subscribe: type, confirmation_token: subscription.confirmation_token)
  end
end
