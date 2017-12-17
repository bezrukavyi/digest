class IssueMailer < ApplicationMailer
  def issue_release(issue, email)
    @issue = issue
    mail(to: email, subject: "##{@issue.id}: #{@issue.name}",
         from: "#{@issue.mailing_list.name} <no-reply@digestify.co>") # TODO change domain name
  end
end
