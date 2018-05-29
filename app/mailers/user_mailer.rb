class UserMailer < ApplicationMailer
  def welcome(user)
    @greeting = "Hi"
    @user = user

    mail to: user.email, subject: "Welcome to our application"

    # mail(
    #   to:       user.email,
    #   subject:  "Restaurant #{user.email} created!"
    # )
  end
end
