class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.integer :machine_id

      t.timestamps
    end
  end
end
