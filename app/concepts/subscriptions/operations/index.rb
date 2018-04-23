module Subscriptions
  class Index < BaseOperation
    step :check_mailing_list
    pass Nested(Subscriptions::FetchFromMailingList)
    fail Nested(Subscriptions::FetchFromUser), Output(:success) => :success

    def check_mailing_list(*)
      params[:mailing_list_id]
    end
  end
end
