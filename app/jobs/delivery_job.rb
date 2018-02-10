class DeliveryJob
  include SuckerPunch::Job

  def perform(issue_id, subscription_id)
    @issue = Issue.find_by(id: issue_id)
    @subscription = issues.mailing_list.subscriptions.find_by(id: subscription_id)
    IssueMailer.issue_release(@issue, @subscription).deliver
  end
end
