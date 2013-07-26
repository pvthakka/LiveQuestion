class AddReference < ActiveRecord::Migration
  def up
  end

  def change
      add_column :posts, :category_id, :reference
  end
  def down
  end
end
