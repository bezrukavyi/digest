module Issues
  class Index < BaseOperation
    attr_env :mailing_list

    step :find_mailing_list
    step :load_issues

    def find_mailing_list(*)
      result = MailingLists::Find.call(params: { id: params[:mailing_list_id] })
      self.mailing_list = result[:model]
      result.success?
    end

    def load_issues(*)
      self.model = IssuesQuery.call(mailing_list.issues, params)
    end
  end
end
