class SubscriptionsController < ApplicationController
  include Rectify::ControllerHelpers

  load_resource :mailing_list, find_by: :slug, only: %i[new edit create]
  load_resource :last_issue, through: :mailing_list, only: %i[new edit create], singleton: true

  def create
    CreateSubscriptionCommand.call(@mailing_list, permit_create_params) do
      on(:success) { |subscription| success_subsribe(subscription) }
      on(:failure) { |subscription| failure_subsribe(subscription) }
    end
  end

  def update
    UpdateSubscriptionCommand.call(params) do
      on(:success_subsribe) { |subscription| success_subsribe(subscription) }
      on(:failure_subsribe) { |subscription| failure_subsribe(subscription) }
    end
  end

  private

  def permit_create_params
    params.require(:subscription).permit(:email)
  end

  def failure_subsribe(subscription)
    redirect_back fallback_location: subscription, flash: { subscription_errors: subscription.errors }
  end

  def success_subsribe(subscription)
    redirect_back fallback_location: subscription, flash: { success: t('subscription.success_subsribe') }
  end
end
