class SubscribeSubscription < Rectify::Command
  attr_reader :subscription, :params

  def initialize(params)
    @subscription = Subscription.find_by(confirmation_token: params[:confirmation_token])
    @params = params
  end

  def call
    return broadcast(:failure) unless subscription
    subscribe ? broadcast(:success) : broadcast(:failure)
  end

  private

  def subscribe
    return subscription.confirm if params[:subscribe] == 'enable'
    return subscription.cancel if params[:subscribe] == 'disable'
  end
end
