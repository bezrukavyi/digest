class SubscriptionMailer < ApplicationMailer
  helper SubscriptionMailerHelper

  def subscribe(subscription, type)
    @subscription = subscription
    @mailing_list = @subscription.mailing_list
    @email = subscription.email

    mail to: @email, subject: t('.subject'), from: from(@mailing_list),
         template_name: "subscribe_#{type}"
  end
end
