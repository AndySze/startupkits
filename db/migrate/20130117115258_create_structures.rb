class CreateStructures < ActiveRecord::Migration
  def change
    create_table :structures do |t|
      t.string :title
      t.integer :idea_id

      t.timestamps
    end
  end
end
