# frozen_string_literal: true

class Instructor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :instructororders
  has_many :instructorcarts

  has_many :courses, dependent: :delete_all

  validates :nickname, presence: true,
                       uniqueness: true,
                       length: { maximum: 20 }

  validates :siret, presence: true,
                    uniqueness: true,
                    length: { is: 14 }

  validates :website, presence: true

  validates :description, presence: true,
                          length: { in: 15..1000 }

  has_one_attached :logo
  before_create :handle_website_url
  after_create :add_default_logo, on: :create
  after_create :welcome_instructor_send
  after_create :welcome_registration_admin_send
  before_update :handle_website_url

  def add_default_logo
    random_logo = rand(1..6)
    logo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logos', "logo-#{random_logo}.jpg")),
                filename: "logo-#{random_logo}.jpg", content_type: 'image/jpg')
  end

  def welcome_instructor_send
    InstructorMailer.welcome_instructor_email(self).deliver_now # appel le mailer UserMailer et l'envoi direct
  end

  def welcome_registration_admin_send
    user_array = User.all.select { |m| m.admin == true }
    user_array.each do |one_user|
      AdminMailer.admin_mailer(one_user).deliver_now
    end
  end

  def handle_website_url
    if website.start_with?('https://')
      website.slice!('https://')
    elsif website.start_with?('http://')
      website.slice!('http://')
    end
  end
end
