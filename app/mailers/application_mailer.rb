class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  helper Rails.application.routes.url_helpers
 
  def from(mailing_list)
    "#{mailing_list.name} <no-reply@digestlist.co>"
  end
end
