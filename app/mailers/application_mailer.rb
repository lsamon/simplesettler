class ApplicationMailer < ActionMailer::Base
  default from: "admin@simplesettler.com", to: "loui.amon@gmail.com"
  layout 'mailer'
end
