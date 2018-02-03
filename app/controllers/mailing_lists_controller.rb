class MailingListsController < ApplicationController
  load_resource :mailing_list, only: %i[show]

  def show
    @issue = @mailing_list.last_issue
    @subscription = Subscription.new
    inject_flash_error(@subscription)
  end
end
