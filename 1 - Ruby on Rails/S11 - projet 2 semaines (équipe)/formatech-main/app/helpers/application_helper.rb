# frozen_string_literal: true

module ApplicationHelper
  def check_if_admin(current_user)
    check_user = if current_user.is_a?(Integer)
                   current_user
                 else
                   current_user.id
                 end
    check_user = User.find(check_user)
    return true if check_user.admin == true
  end

  include CoursesHelper
  include InstructorsHelper
  include UsersHelper
end
