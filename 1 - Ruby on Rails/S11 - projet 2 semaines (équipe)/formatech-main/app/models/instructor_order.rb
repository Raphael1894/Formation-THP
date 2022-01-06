# frozen_string_literal: true

class InstructorOrder < ApplicationRecord
  validates :instructor_id, presence: true
  validates :course_id, presence: true

  belongs_to :instructor, optional: true
  belongs_to :course, optional: true
end
