# frozen_string_literal: true

module UsersHelper
  def instructor_array_all
    Instructor.where(id: Instructor.first.id..Instructor.last.id)
  end

  def course_array_by_instructor(one_instructor)
    Course.all.select { |m| m.instructor_id == one_instructor.id }
  end

  def favorite_array_by_params
    Favorite.all.select { |m| m.user_id == params[:id].to_i }
  end

  def featured_courses(one_course)
    CoursesFeatured.find_by(course_id: one_course.id)
  end
end
