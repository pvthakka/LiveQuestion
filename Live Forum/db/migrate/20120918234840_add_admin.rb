class AddAdmin < ActiveRecord::Migration
  def up
  end
  def change
    add_column :users, :admin, :integer
  end
  def down
  end
end
