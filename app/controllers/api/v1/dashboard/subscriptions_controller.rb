module Api::V1::Dashboard
  class SubscriptionsController < Api::V1::ApplicationController
    def index
      @result = Subscriptions::Index.call(params: params, current_user: current_user)
      respond_to_result
    end
  end
end
