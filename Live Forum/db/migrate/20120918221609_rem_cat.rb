class RemCat < ActiveRecord::Migration
  def up
  end

  def change
    remove_column :posts, :category
  end
  def down
  end
end
