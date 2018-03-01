module Subscriptions
  class FetchFromMailingList < Trailblazer::Operation
    step Policy::Guard(:check_user, name: :current_user)
    step Policy::Guard(:find_mailing_list, name: :mailing_list)
    step :extract_subscriptions

    def check_user(env, params:, **)
      env[:current_user]
    end

    def find_mailing_list(env, params:, **)
      result = MailingLists::Find.call(
        params: { id: params[:mailing_list_id] },
        current_user: env[:current_user]
      )

      env[:mailing_list] = result[:model]

      result.success?
    end

    def extract_subscriptions(env, params:, **)
      env[:model] = env[:mailing_list].subscriptions
    end
  end
end
