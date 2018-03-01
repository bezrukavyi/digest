module Dashboard
  class SubscriptionsController < ApplicationController
    def index
      @result = Subscriptions::Index.call(params: params, current_user: current_user)
      respond_to_result
    end
  end
end
