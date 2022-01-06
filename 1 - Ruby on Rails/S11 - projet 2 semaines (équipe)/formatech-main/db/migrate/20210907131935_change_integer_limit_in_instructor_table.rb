# frozen_string_literal: true

class ChangeIntegerLimitInInstructorTable < ActiveRecord::Migration[5.2]
  def change
    change_column :instructors, :siret, :integer, limit: 8
  end
end
