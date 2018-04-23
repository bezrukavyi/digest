module Subscriptions
  class FetchFromUser < BaseOperation
    attr_env :current_user

    step Policy::Guard(:check_user)
    step :extract_collection

    def check_user(*)
      current_user
    end

    def extract_collection(*)
      self.model = current_user.subscriptions
    end
  end
end
