class UserMailer < ApplicationMailer
    default from: 'florent.nuttens@e-i.com'

    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: "Welcome")
    end
end
