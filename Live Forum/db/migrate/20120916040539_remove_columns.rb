class RemoveColumns < ActiveRecord::Migration
  def up
  end
  def change
    remove_column :users, :updated_at
    remove_column :users, :created
  end
  def down
  end
end
