module Api
  module V1
    class ApplicationController < ::ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken

      self.responder = Responders::ApplicationResponder

      respond_to :json

      protect_from_forgery with: :null_session

      alias current_user current_api_v1_user
      alias authenticate_user! authenticate_api_v1_user!
    end
  end
end
