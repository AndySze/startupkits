class CreateUvps < ActiveRecord::Migration
  def change
    create_table :uvps do |t|
      t.string :title
      t.string :description
      t.integer :idea_id

      t.timestamps
    end
  end
end
