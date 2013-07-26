class AddCreatedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :created, :datetime
    remove_column :users, :updated_at
  end
end
