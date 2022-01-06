# frozen_string_literal: true

class CreateInstructorOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :instructor_orders do |t|
      t.belongs_to :instructor, index: true
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
