class SendInfomationMailer < ApplicationMailer
  def restaurant_information email
    @email = email
    mail(to: email, subject: t("static_pages.send_email.subject"))
  end
end
