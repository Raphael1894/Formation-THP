# frozen_string_literal: true

class InstructorMailer < ApplicationMailer
  default from: 'formatech.cntact@gmail.com'

  def welcome_instructor_email(instructor)
    @instructor = instructor
    @url = 'https://formatech-org.herokuapp.com/'
    attachments.inline['Formatech-logo.png'] = File.read("#{Rails.root}/app/assets/images/mailerpimp/Formatech-logo.png")
    mail(to: @instructor.email, subject: 'Welcome !')
  end

  def confirmation_creation_course(current_instructor)
    @instructor = current_instructor
    @url = 'https://formatech-org.herokuapp.com/'
    attachments.inline['Formatech-logo.png'] = File.read("#{Rails.root}/app/assets/images/mailerpimp/Formatech-logo.png")
    mail(to: @instructor.email, subject: 'Confirmation of the creation of your course')
  end

  def confirmation_delete_course(one_instructor)
    @instructor = one_instructor
    @url = 'https://formatech-org.herokuapp.com/'
    attachments.inline['Formatech-logo.png'] = File.read("#{Rails.root}/app/assets/images/mailerpimp/Formatech-logo.png")
    mail(to: @instructor.email, subject: 'Confirmation of the deletion of your course')
  end

  def confirmation_order(current_instructor)
    @instructor = current_instructor
    @url = 'https://formatech-org.herokuapp.com/'
    attachments.inline['Formatech-logo.png'] = File.read("#{Rails.root}/app/assets/images/mailerpimp/Formatech-logo.png")
    mail(to: @instructor.email, subject: 'Confirmation of your purchase')
  end
end
