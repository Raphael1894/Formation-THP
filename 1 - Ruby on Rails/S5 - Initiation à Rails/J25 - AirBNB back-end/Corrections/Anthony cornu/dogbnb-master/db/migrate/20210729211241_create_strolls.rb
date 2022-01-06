class CreateStrolls < ActiveRecord::Migration[6.1]
  def change
    create_table :strolls do |t|
      t.datetime :walk
      t.timestamps
    end
  end
end
