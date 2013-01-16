class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :title
      t.integer :idea_id

      t.timestamps
    end
  end
end
