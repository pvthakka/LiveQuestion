class RemovePostColumn < ActiveRecord::Migration
  def up
  end

  def down
    remove_column :users, :updated_at
    remove_column :users, :created
  end
end
