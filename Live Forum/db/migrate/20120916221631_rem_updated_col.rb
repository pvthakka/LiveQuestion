class RemUpdatedCol < ActiveRecord::Migration
  def up
  end
  def change
    remove_column :comments, :updated_at

  end
  def down
  end
end
