class SubscriptionsController < ApplicationController
  include Rectify::ControllerHelpers

  load_resource :mailing_list, find_by: :slug, only: %i[new create]

  def new
    @subscription = Subscription.new
  end

  def create
    CreateSubscriptionCommand.call(@mailing_list, permit_create_params) do
      on(:success) { redirect_to '/' }
      on(:failure) do |subscription|
        expose(subscription: subscription)
        render :new
      end
    end
  end

  def update
    UpdateSubscriptionCommand.call(params) do
      on(:success_subsribe) { redirect_to '' }
      on(:failure_subsribe) { redirect_to '/failure_subsribe' }
    end
  end

  private

  def permit_create_params
    params.require(:subscription).permit(:email)
  end
end
