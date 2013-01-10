class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
