module Dashboard::Issues
  class Index < BaseOperation
    attr_env :mailing_list
    attr_env :current_user

    step :find_mailing_list
    step Policy::Guard(:check_mailing_list, name: :mailing_list)
    step :load_issues

    def find_mailing_list(*)
      result = MailingLists::Find.call(env, params: params)
      self.mailing_list = result[:model]
      result.success?
    end

    def check_mailing_list(*)
      BasePolicy.new(current_user, model).show?
    end

    def load_issues(*)
      self.model = mailing_list.issues
    end
  end
end
