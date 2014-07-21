class UserMailer < ActionMailer::Base
  default from: "notification@lightemr.com"

  def welcome_email(user)
    @user = user
    @url = 'https://lightemr.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Light EMR')
  end
end
