class ApplicationMailer < ActionMailer::Base
  default from: "webmaster@simplesettler.com", to:"xenial.nickel@gmail.com"
  layout 'mailer'
end
