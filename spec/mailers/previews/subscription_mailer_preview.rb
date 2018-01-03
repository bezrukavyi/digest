# Preview all emails at http://localhost:3000/rails/mailers
class SubscriptionMailerPreview < ActionMailer::Preview
  def confirmation
    SubscriptionMailer.confirmation(Subscription.first)
  end
end
