class AddCommentField < ActiveRecord::Migration
  def up
  end
  def change
    add_column :posts, :commented, :integer
  end
  def down
  end
end
