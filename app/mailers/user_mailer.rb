class UserMailer < ApplicationMailer
  default from: 'info@socializeer.com'

  def welcome_email(user)
  	@user = user
  	@url = 'http://socializeer.herokuapp.com'
  	mail(to: @user.email, subject: 'Welcome to our site')
  end
end
