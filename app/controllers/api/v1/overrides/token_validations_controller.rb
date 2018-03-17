module Api
  module V1
    module Overrides
      class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
        def validate_token
          super
        end

        protected

        def render_validate_token_success
          render json: @resource
        end
      end
    end
  end
end
