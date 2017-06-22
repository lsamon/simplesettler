class UserMailer < ApplicationMailer
  add_template_helper(CountriesHelper)
  #email to customer
  def payment_success_email(user, package_detail)
    @user = user
    @package_detail = package_detail
    @email_subject = "Payment for #{package_detail.name} success"
    mail(to: @user.email, subject: @email_subject)

  end

  #admin email
  def email_to_admin(admin, current_user, package_detail)
    @user = current_user
    @package_detail = package_detail
    @email_subject = "A Request for #{package_detail.name}"
    attachments[@user.user_detail.resume_url] = open(@user.user_detail.resume_url).read
    mail(to: admin.email, subject: @email_subject)
  end
end
