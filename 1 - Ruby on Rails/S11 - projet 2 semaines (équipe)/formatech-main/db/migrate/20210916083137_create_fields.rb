# frozen_string_literal: true

class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.belongs_to :course, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
