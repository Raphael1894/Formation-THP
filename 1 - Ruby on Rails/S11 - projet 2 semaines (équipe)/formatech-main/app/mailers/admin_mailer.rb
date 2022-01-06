# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  default from: 'formatech.cntact@gmail.com'

  def admin_mailer(one_user)
    @url = 'https://formatech-org.herokuapp.com/'
    attachments.inline['Formatech-logo.png'] = File.read("#{Rails.root}/app/assets/images/mailerpimp/Formatech-logo.png")
    mail(to: one_user.email, subject: 'New registration of an instructor!')
  end

  def info_creation_course(current_instructor, one_user)
    @instructor = current_instructor
    @url = 'https://formatech-org.herokuapp.com/'
    attachments.inline['Formatech-logo.png'] = File.read("#{Rails.root}/app/assets/images/mailerpimp/Formatech-logo.png")
    mail(to: one_user.email, subject: 'Creation of a course by instructor')
  end

  def info_delete_course(one_instructor, one_user)
    @instructor = one_instructor
    @url = 'https://formatech-org.herokuapp.com/'
    attachments.inline['Formatech-logo.png'] = File.read("#{Rails.root}/app/assets/images/mailerpimp/Formatech-logo.png")
    mail(to: one_user.email, subject: 'Deletion of a course by instructor')
  end
end
