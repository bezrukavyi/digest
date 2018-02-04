class IssueMailer < ApplicationMailer
  helper :application, :issues

  def issue_release(issue, email)
    @issue = issue
    mail(to: email, subject: "##{@issue.release_number}: #{@issue.name}", from: from(@issue.mailing_list))
  end
end
