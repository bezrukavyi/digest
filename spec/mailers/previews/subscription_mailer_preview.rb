# Preview all emails at http://localhost:3000/rails/mailers
class SubscriptionMailerPreview < ActionMailer::Preview
  def subsribe_enable
    SubscriptionMailer.subscribe(Subscription.first, :enable)
  end

  def subsribe_disable
    SubscriptionMailer.subscribe(Subscription.first, :disable)
  end
end
