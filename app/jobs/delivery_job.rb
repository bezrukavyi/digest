class DeliveryJob
  include SuckerPunch::Job

  def perform(issue_id, email)
    @issue = Issue.find_by(id: issue_id)
    IssueMailer.issue_release(@issue, email).deliver
  end
end
