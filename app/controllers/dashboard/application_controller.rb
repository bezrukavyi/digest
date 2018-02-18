class Dashboard::ApplicationController < ApplicationController
  layout 'dashboard'

  before_action :check_current_user

  private

  def check_current_user
    redirect_to new_user_session_path unless current_user
  end
end
