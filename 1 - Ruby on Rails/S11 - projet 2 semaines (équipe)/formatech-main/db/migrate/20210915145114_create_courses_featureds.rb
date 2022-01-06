# frozen_string_literal: true

class CreateCoursesFeatureds < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_featureds do |t|
      t.belongs_to :course, index: true
      t.string :stripeToken
      t.timestamps
    end
  end
end
