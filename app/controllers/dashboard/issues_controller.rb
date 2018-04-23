module Dashboard
  class IssuesController < ApplicationController
    def index
      @result = Dashboard::Issues::Index.call(params: params, current_user: current_user)
      respond_to_result
    end
  end
end
