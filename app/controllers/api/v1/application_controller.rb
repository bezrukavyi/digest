module Api
  module V1
    class ApplicationController < ActionController::Base
      include DeviseTokenAuth::Concerns::SetUserByToken
      include ResultHandler
      include Redirect

      self.responder = Responders::ApplicationResponder

      respond_to :json

      alias current_user current_api_v1_user
      alias authenticate_user! authenticate_api_v1_user!
    end
  end
end
