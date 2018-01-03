module SubscriptionMailerHelper
  def confirmation_url(subscription)
    link_to 'Confirm', subscription_confirmation_url(subscribe: 'enable', confirmation_token: subscription.confirmation_token)
  end
end
