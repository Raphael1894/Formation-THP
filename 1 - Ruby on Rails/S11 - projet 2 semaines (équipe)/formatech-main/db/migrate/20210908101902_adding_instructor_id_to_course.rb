# frozen_string_literal: true

class AddingInstructorIdToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :instructor, foreign_key: true
  end
end
