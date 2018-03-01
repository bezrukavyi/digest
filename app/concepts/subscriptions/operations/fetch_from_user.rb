module Subscriptions
  class FetchFromUser < Trailblazer::Operation
    step Policy::Guard(:check_user)
    step :extract_collection

    def check_user(env, params:, **)
      env[:current_user]
    end

    def extract_collection(env, params:, **)
      env[:model] = env[:current_user].subscriptions
    end
  end
end
