class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def from(mailing_list)
    "#{mailing_list.name} <no-reply@digestify.co>"
  end
end
