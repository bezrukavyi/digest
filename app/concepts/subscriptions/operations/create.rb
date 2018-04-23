module Subscriptions
  class Create < BaseOperation
    attr_env :mailing_list

    PRESENT = ->(*) { Subscriptions::New }

    step Policy::Guard(:find_mailing_list, name: :mailing_list)
    step :assing_mailing_list
    step Nested(PRESENT)
    step Contract::Validate()
    step Contract::Persist()
    step :confirm_token
    step :send_email

    def find_mailing_list(*)
      result = MailingLists::Find.call(env, params: params)
      self.mailing_list = result[:model]
      result.success?
    end

    def assing_mailing_list(*)
      params[:mailing_list_id] = mailing_list.id
    end

    def confirm_token(*)
      model.confirmation_token!
    end

    def send_email(*)
      SubscribeMailJob.perform_async(model.id, :enable)
    end
  end
end
