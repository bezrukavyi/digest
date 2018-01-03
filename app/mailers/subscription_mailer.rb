class SubscriptionMailer < ApplicationMailer
  helper SubscriptionMailerHelper

  def confirmation(subscription)
    @subscription = subscription
    @mailing_list = @subscription.mailing_list
    @email = subscription.email

    mail(to: @email, subject: t('.subject'), from: from(@mailing_list))
  end
end
