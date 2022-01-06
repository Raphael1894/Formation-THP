# frozen_string_literal: true

class CreateInstructorCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :instructor_carts do |t|
      t.belongs_to :instructor, index: true
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
