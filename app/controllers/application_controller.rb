class ApplicationController < ActionController::Base
  include Flashable
  include ResultMatcher
  include ResultHandler
  include DeviceResource

  protect_from_forgery with: :exception
end
