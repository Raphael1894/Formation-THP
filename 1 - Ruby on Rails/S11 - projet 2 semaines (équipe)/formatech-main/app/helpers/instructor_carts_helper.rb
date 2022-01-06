# frozen_string_literal: true

module InstructorCartsHelper
  def look_for_instructor(current_instructor)
    InstructorCart.all.select { |m| m.instructor_id == current_instructor.id }
  end
end
