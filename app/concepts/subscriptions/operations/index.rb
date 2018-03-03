module Subscriptions
  class Index < Trailblazer::Operation
    step :check_mailing_list
    pass Nested(Subscriptions::FetchFromMailingList)
    fail Nested(Subscriptions::FetchFromUser), Output(:success) => :success

    def check_mailing_list(_env, params:, **)
      params[:mailing_list_id]
    end
  end
end
