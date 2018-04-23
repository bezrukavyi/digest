module Subscriptions
  class FetchFromMailingList < BaseOperation
    attr_env :current_user
    attr_env :mailing_list

    step Policy::Guard(:check_user, name: :current_user)
    step Policy::Guard(:find_mailing_list, name: :mailing_list)
    step :extract_subscriptions

    def check_user(*)
      current_user
    end

    def find_mailing_list(*)
      result = MailingLists::Find.call(env, params: params)
      self.mailing_list = result[:model]
      result.success?
    end

    def extract_subscriptions(*)
      self.model = mailing_list.subscriptions
    end
  end
end
