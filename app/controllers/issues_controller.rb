class IssuesController < ApplicationController
  load_resource :mailing_list, find_by: :slug, only: %i[index show]
  load_resource :issues, through: :mailing_list, singleton: true, only: %i[index show]

  def index
    @issues = @issues.released.page(params[:page])
  end

  def show
    @issue = @issues.released.find_by(release_number: params[:id])
    @subscription = Subscription.new
  end
end
