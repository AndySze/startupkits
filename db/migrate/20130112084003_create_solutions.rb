class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :feature
      t.string :description
      t.integer :idea_id

      t.timestamps
    end
  end
end
