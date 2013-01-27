class CreateIdeaManagements < ActiveRecord::Migration
  def change
    create_table :idea_managements do |t|
      t.integer :idea_id
      t.integer :user_id
      t.string :user_type, :limit => 10

      t.timestamps
    end

    add_index :idea_managements, :idea_id
    add_index :idea_managements, :user_id
  end
end
