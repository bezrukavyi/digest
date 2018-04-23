module Issues
  class Find < BaseOperation
    attr_env :mailing_list

    step :find_mailing_list
    step :find_issue

    def find_mailing_list(*)
      result = MailingLists::Find.call(params: { id: params[:mailing_list_id] })
      self.mailing_list = result[:model]
      result.success?
    end

    def find_issue(*)
      options = { page: params[:page], include: env[:include] }
      self.model = IssuesQuery.call(mailing_list.issues, options).friendly.find(params[:id])
    end
  end
end
