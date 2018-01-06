class UpdateSubscriptionCommand < Rectify::Command
  attr_reader :subscription, :params

  def initialize(params)
    @params = params
  end

  def call
    return subscribe if params[:subscribe]
    broadcast(:failure)
  end

  def subscribe
    subscription = Subscription.find_by(confirmation_token: params[:confirmation_token])
    subscribe_action = SubscribeSubscriptionService.call(subscription, params)
    subscribe_action.success? ? broadcast(:success_subsribe) : broadcast(:failure_subsribe)
  end
end
