# frozen_string_literal: true

class Course < ApplicationRecord
  acts_as_votable

  belongs_to :course_featured, optional: true

  has_many :favorites
  has_many :users, through: :favorites

  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments

  has_many :fields
  has_many :tags, through: :fields
  accepts_nested_attributes_for :fields

  validates :description, presence: true,
                          length: { in: 3..2000 }

  validates :title, presence: true,
                    length: { in: 3..70 }

  validates :price, presence: true,
                    length: { maximum: 7 }

  validates :duration, presence: true,
                       numericality: { greater_than_or_equal_to: 0 }

  validates :start_date, presence: true

  validates :duration_scale, presence: true

  validates :address, presence: true,
                      length: { in: 3..300 }

  validates :zip_code, presence: true,
                       length: { maximum: 7 }

  validate :datetime_eligibility

  has_one_attached :picture
  
  before_create :attribute_picture, on: :create

  def attribute_picture
    random_course = rand(1..10).to_s
    picture.attach(io: File.open(Rails.root.join('app',
                                                 'assets',
                                                 'images',
                                                 'pictures',
                                                 "course-#{random_course}.jpg")),
                                                  filename: "course-#{random_course}.jpg",
                                                  content_type: 'image/jpg')
  end
  
  def datetime_eligibility
    errors.add(:base, "can't be in past") if start_date < Time.current
  end
end
