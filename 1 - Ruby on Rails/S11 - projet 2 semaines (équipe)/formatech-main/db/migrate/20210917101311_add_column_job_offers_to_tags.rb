# frozen_string_literal: true

class AddColumnJobOffersToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :job_offer, :integer, default: 0
  end
end
