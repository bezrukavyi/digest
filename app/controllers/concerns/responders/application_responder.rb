module Responders
  class ApplicationResponder < ActionController::Responder
    include HttpCacheResponder
    include JsonResponder
  end
end
