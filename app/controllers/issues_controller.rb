class IssuesController < ApplicationController
  load_resource :mailing_list, only: %i[index show]
  load_resource :issues, through: :mailing_list, singleton: true, only: %i[index show]

  def index
    @issues = Queries::Issues.call(@issues, params)
  end

  def show
    @issues = Queries::Issues.call(@issues, params)
    @issue = @issues.released.friendly.find(params[:id])
    @subscription = Subscription.new
    inject_flash_error(@subscription)
  end
end
