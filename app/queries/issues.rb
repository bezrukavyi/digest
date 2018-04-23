class IssuesQuery
  def self.call(issues, params)
    issues.includes(params[:include] || []).released.newest.page(params[:page])
  end
end
