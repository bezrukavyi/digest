module Api
  module V1
    module Overrides
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        protected

        def render_create_success
          render json: @resource, status: :created
        end

        def permit_sign_up_params
          params.permit(:email, :password, :password_confirmation)
        end
      end
    end
  end
end
