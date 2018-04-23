module Dashboard::Issues
  class Create < BaseOperation
    attr_env :current_user
    attr_env :mailing_list

    PRESENT = ->(*) { New }

    step Nested(PRESENT)
    step Policy::Guard(:check_user, name: :current_user)
    step Policy::Guard(:find_mailing_list, name: :mailing_list)
    step Policy::Pundit(BasePolicy, :create?)
    step Contract::Validate()
    step Contract::Persist()

    def check_user(*)
      current_user
    end

    def find_mailing_list(*)
      result = MailingLists::Find.call(env, params: params)
      self.mailing_list = result[:model]
      result.success?
    end
  end
end
