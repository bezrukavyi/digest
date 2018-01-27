class ApplicationController < ActionController::Base
  include Localable
  include Flashable
  
  protect_from_forgery with: :exception
end
