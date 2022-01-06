class RemoveDogFromStroll < ActiveRecord::Migration[6.1]
  def change
    remove_column :strolls, :dog_id
  end
end
