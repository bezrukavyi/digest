class ApplicationController < ActionController::Base
  include Flashable

  protect_from_forgery with: :exception
end
