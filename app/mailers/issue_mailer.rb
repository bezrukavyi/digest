class IssueMailer < ApplicationMailer
  helper :application, :issues
  helper SubscriptionMailerHelper

  def issue_release(issue, subscription)
    @issue = issue
    @subscription = subscription
    mail(to: @subscription.email, subject: "##{@issue.release_number}: #{@issue.name}", from: from(@issue.mailing_list))
  end
end
