class Droptable < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.integer :user_id
      t.string :message
      t.datetime :created_at
      t.references :category
    end
  end

  def down

  end
end
