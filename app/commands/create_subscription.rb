class CreateSubscription < Rectify::Command
  attr_reader :mailing_list, :params

  def initialize(mailing_list, params)
    @mailing_list = mailing_list
    @params = params
  end

  def call
    subscription = Subscription.new(params.merge(mailing_list: mailing_list))

    return broadcast(:failure, subscription) unless subscription.save

    SubscriptionConfirmEmail.call(subscription.id)
    broadcast(:success)
  end
end
