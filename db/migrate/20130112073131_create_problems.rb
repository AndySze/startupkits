class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.string :description
      t.integer :idea_id

      t.timestamps
    end
  end
end
