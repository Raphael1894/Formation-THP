# frozen_string_literal: true

module InstructorsHelper
  def course_array_by_params
    Course.all.select { |m| m.instructor_id == params[:id].to_i }
  end

  def instructor_by_id
    Instructor.find(params[:id].to_i)
  end

  def featured_courses(one_course)
    CoursesFeatured.find_by(course_id: one_course.id)
  end
end
