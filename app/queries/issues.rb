module Queries
  class Issues
    def self.call(issues, params)
      issues.released.newest.page(params[:page])
    end
  end
end
