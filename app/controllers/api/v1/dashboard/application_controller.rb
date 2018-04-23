module Api::V1::Dashboard
  class ApplicationController < Api::V1::ApplicationController
    before_action :authenticate_user!
  end
end
