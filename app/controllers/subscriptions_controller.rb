class SubscriptionsController < ApplicationController
  include Rectify::ControllerHelpers

  before_action :mailing_list, only: %i[create new]

  def new
    @subscription = Subscription.new
  end

  def create
    CreateSubscription.call(@mailing_list, permit_create_params) do
      on(:success) { redirect_to '/' }
      on(:failure) do |subscription|
        expose(subscription: subscription)
        render :new
      end
    end
  end

  def subscribe
    SubscribeSubscription.call(params) do
      on(:success) { redirect_to '/' }
      on(:failure) { redirect_to '/failure' }
    end
  end

  private

  def permit_create_params
    params.require(:subscription).permit(:email)
  end

  def mailing_list
    @mailing_list = MailingList.friendly.find(params[:mailing_list_id])
  end
end
