class MailingListsController < ApplicationController
  def show
    @mailing_list = MailingList.friendly.find(params[:id])
  end
end
