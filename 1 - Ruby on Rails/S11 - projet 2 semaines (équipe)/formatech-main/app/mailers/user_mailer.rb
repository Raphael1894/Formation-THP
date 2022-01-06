# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'formatech.cntact@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://formatech-org.herokuapp.com/'
    attachments.inline['Formatech-logo.png'] = File.read("#{Rails.root}/app/assets/images/mailerpimp/Formatech-logo.png")
    mail(to: @user.email, subject: 'Welcome !')
  end
end
