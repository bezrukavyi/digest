class MailingListsController < ApplicationController
  def show
    @mailing_list = MailingList.friendly.find(params[:id])
    @issue = @mailing_list.last_issue
    @subscription = Subscription.new
  end
end
