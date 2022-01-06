# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.decimal :price
      t.boolean :has_diploma, default: false
      t.text :description
      t.boolean :is_remote, default: true
      t.string :adress
      t.integer :zip_code
      t.string :image_url
      t.integer :duration, default: 0
      t.datetime :start_date
      t.string :duration_scale, default: 'hour'

      t.timestamps
    end
  end
end
