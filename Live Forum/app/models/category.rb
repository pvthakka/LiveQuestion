class Category < ActiveRecord::Base
  attr_accessible :category
  has_many :posts, :dependent => :destroy
  validates_uniqueness_of :category
  validates_presence_of :category
end
