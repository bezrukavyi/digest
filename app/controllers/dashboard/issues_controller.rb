module Dashboard
  class IssuesController < ApplicationController
    def index
      result = Issues::Index.call(mailing_list_id: params[:mailing_list_id], current_user: current_user)
      render json: result['representer.render.class'].new(result[:model])
    end
  end
end
