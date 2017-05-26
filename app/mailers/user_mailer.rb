class UserMailer < ApplicationMailer

  #email to customer
  def payment_success_email(user, package_detail)
      @user = user
      @package_detail = package_detail
    mail(to: @user.email, subject: "Payment for #{package_detail.name} success")
  end

  #admin email
  def email_to_admin(user, package_detail)
    @user = user
    @package_detail = package_detail
    mail(subject: "A Request for #{package_detail.name}")
  end
end
