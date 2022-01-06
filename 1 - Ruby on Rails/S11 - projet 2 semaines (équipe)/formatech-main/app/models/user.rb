# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :instructor_orders
  has_many :instructor_carts
  has_many :instructororders
  has_many :instructorcarts

  validates :nickname, presence: true,
                       uniqueness: true,
                       length: { maximum: 20 }

  has_many :favorites
  has_many :courses, through: :favorites

  has_many :comments
  has_many :courses, through: :comments

  has_one_attached :avatar

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now # appel le mailer UserMailer et l'envoi direct
  end

  after_create :add_default_avatar, on: :create

  def add_default_avatar
    random_avatar = rand(1..6)
    avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatars', "avatar-#{random_avatar}.jpg")),
                  filename: "user#{random_avatar}.jpg",
                  content_type: 'image/jpg')
  end
end
