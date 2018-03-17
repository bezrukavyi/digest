module Api
  module V1
    module Overrides
      class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
        before_action :check_auth_info

        def get_resource_from_auth_hash
          @result = AuthProviders::Identify.call(params: auth_hash.deep_symbolize_keys)

          if @result.success?
            @resource = @result[:model].resource
          else
            oauth_failure
          end
        end

        private

        def auth_origin_url
          ENV['OAUTH_SUCCESS']
        end

        def create_auth_params
          @auth_params = {
            'access-token': @token,
            'client': @client_id,
            'uid': @resource.uid
          }

          @auth_params[:oauth_registration] = true if @oauth_registration
          @auth_params
        end

        def check_auth_info
          return if auth_hash&.dig('info', 'email')
          oauth_failure
        end

        def oauth_failure
          redirect_to ENV['OAUTH_FAILURE']
        end
      end
    end
  end
end
