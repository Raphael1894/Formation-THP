# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.text :description, default: 'Description'

      t.timestamps
    end
  end
end
