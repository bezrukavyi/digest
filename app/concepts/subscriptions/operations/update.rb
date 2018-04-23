module Subscriptions
  class Update < BaseOperation
    attr_env :mailing_list

    step :model!
    step :subscribe

    def model!(*)
      self.model = Subscription.find_by(confirmation_token: params[:confirmation_token])
    end

    def subscribe(*)
      return failure unless params[:subscribe]
      SubscribeSubscriptionService.call(model, params)
    end
  end
end
