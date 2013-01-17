class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.string :title
      t.integer :idea_id

      t.timestamps
    end
  end
end
