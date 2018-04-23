module Api::V1
  class SubscriptionsController < ApplicationController
    def create
      @result = Subscriptions::Create.call(params: permit_create_params)
      respond_to_result
    end

    def update
      @result = Subscriptions::Update.call(params: update_params)
      respond_to_result do |on|
        on.success { success_update(@result) }
      end
    end

    private

    def update_params
      {
        confirmation_token: params[:confirmation_token],
        subscribe: params[:subscribe]
      }
    end

    def permit_create_params
      params.require(:subscription).permit(:email).merge(mailing_list_id: params[:mailing_list_id])
    end

    def success_update(result)
      path = ENV['CLIENT_PATH'] + "/#{result[:model].mailing_list.slug}"
      redirect_with_params path, success: t("mailing_lists.subscription_mail.success_#{params[:subscribe]}")
    end
  end
end
