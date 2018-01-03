class IssueMailer < ApplicationMailer
  def issue_release(issue, email)
    @issue = issue
    mail(to: email, subject: "##{@issue.release_number}: #{@issue.name}", from: from(@issue.mailing_list)) # TODO change domain name
  end
end
