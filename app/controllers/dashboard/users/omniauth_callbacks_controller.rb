module Dashboard
  module Users
    class OmniauthCallbacksController < Devise::OmniauthCallbacksController
      include ResultHandler

      def facebook
        dispatch_provider
      end

      def google_oauth2
        dispatch_provider
      end

      private

      def dispatch_provider
        result = AuthProviders::Identify.call(params: request.env['omniauth.auth'])

        result_matcher(result) do |on|
          on.success { sign_in_and_redirect result[:model].resource, event: :authentication }
          on.failure { redirect_to new_user_registration_url }
        end
      end
    end
  end
end
