class UserMailer < ApplicationMailer
  #payment for consultation
  def payment_success_consultation_email(user)
    @user = user
    mail(to: @user.email, subject: "Payment for consultati0n success")
  end

  def email_to_admin(user)
    @user = user

    mail(subject: "A Request for consultation")

  end
end
