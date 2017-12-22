class IssuesController < ApplicationController
  def index
    issues
  end

  def show
    @issue = issues.find_by(release_number: params[:id])
  end

  private

  def issues
    @issues = MailingList.friendly.find(params[:mailing_list_id]).issues.released
  end
end
