class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :message
      t.datetime :created_at
      t.string :category

      t.references :category
    end
  end
end
