# frozen_string_literal: true

class AddSlugToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :slug, :string
    add_index :courses, :slug, unique: true
  end
end
