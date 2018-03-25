class ApplicationController < ActionController::Base
  include Flashable
  include ResultMatcher
  include ResultHandler
end
