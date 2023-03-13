class ApplicationMailer < ActionMailer::Base
  default from: ENV['SENDER_ADDRESS']
  layout "mailer"
end
