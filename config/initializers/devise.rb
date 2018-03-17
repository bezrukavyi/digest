Devise.setup do |config|
  config.mailer_sender = ENV['MAILGUN_USERNAME']
  config.secret_key = ENV['SECRET_KEY_BASE']
end
