# frozen_string_literal: true

class UpdateColumnNamesAndRemoveImageUrls < ActiveRecord::Migration[5.2]
  def change
    change_table :courses do |t|
      t.rename :has_diploma, :diploma
      t.rename :is_remote, :remote
    end
    rename_column :users, :is_admin, :admin
    rename_column :courses, :adress, :address

    remove_column :courses, :image_url, :string
    remove_column :users, :image_url, :string
    remove_column :instructors, :image_url, :string
  end
end
