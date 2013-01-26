class AddKeyToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :key, :string
    add_index :ideas, :key
  end
end
