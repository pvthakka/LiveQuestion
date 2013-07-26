class Addcategory < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :category
     end
  end

  def self.down
  end
end
