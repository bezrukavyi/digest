class ApplicationController < ActionController::Base
  include Flashable
  include ResultMatcher
  include ResultHandler

  protect_from_forgery with: :exception
end
