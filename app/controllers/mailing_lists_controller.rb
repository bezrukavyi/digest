class MailingListsController < ApplicationController
  def show
    @mailing_list = MailingList.friendly.find(params[:id])
    @issue = @mailing_list.issues.released.last
  end
end
