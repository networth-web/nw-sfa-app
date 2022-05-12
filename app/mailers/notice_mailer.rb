class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.greeting.subject
  #
  def greeting(user, notification_type)
    @user = user
    @notification_type = notification_type

    mail(to: @user.email, subject: '顧客管理システムからの通知です')
  end
end
