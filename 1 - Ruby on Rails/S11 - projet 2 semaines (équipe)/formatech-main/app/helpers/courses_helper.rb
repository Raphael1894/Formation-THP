# frozen_string_literal: true

module CoursesHelper
  def find_course_by_params
    Course.find(params[:id].to_i)
  end
  def find_instructor(one_course)
    one_instructor = one_course.instructor_id
    instructor_nickname = Instructor.find(one_instructor)
    instructor_nickname.nickname
  end

  def comment_array_by_params
    Comment.all.select { |m| m.course_id == params[:id].to_i }
  end

  def comment_array_by_course(one_course)
    Comment.all.select { |m| m.course_id == one_course.id }
  end

  def user_by_comment_user_id(comment)
    User.find(comment.user_id)
  end

  def user_by_admin
    User.all.select { |m| m.admin == true }
  end

  def all_tags
    Tag.select(:name)
  end

  def create_tags
    fields = params[:fields]
    selected_tags = fields.select { |_key, value| value == 1.to_s }
    new_course = Course.last.id + 1
    selected_tags.each do |one_tag, _value|
      Field.create!(course_id: new_course,
                    tag_id: one_tag)
    end
  end

  def update_tags
    Field.where(course_id: params[:id]).destroy_all
    fields = params[:fields]
    selected_tags = fields.select { |_key, value| value == 1.to_s }
    selected_tags.each do |one_tag, _value|
      Field.create!(course_id: params[:id],
                    tag_id: one_tag)
    end
  end

  def course_creation_email
    InstructorMailer.confirmation_creation_course(current_instructor).deliver_now
    user_by_admin.each do |one_user|
      AdminMailer.info_creation_course(current_instructor, one_user).deliver_now
    end
  end

  def course_destroy_email(one_instructor)
    user_by_admin.each do |one_user|
      AdminMailer.info_delete_course(one_instructor, one_user).deliver_now
    end
    InstructorMailer.confirmation_delete_course(one_instructor).deliver_now
  end
end
