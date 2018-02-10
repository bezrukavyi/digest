# Preview all emails at http://localhost:3000/rails/mailers/issue_mailer
class IssueMailerPreview < ActionMailer::Preview
  def issue_release
    subscription = Subscription.first
    issue = subscription.mailing_list.issues.last
    IssueMailer.issue_release(issue, subscription)
  end
end
