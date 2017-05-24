class ApplicationMailer < ActionMailer::Base
  # default from: "from@example.com", to:"admin@simplesettler.com"
  default from: "webmaster@simplesettler.com", to:"xenial.nickel@gmail.com"
  layout 'mailer'
end
