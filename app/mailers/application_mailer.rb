class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_SENDER'] || 'from@example.com'
  layout 'mailer'
end
