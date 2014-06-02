class UserMailer < ActionMailer::Base
  default from: "notification@lightemr.com"

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to Light EMR')
  end
end
