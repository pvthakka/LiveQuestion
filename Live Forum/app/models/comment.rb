class Comment < ActiveRecord::Base
  attr_accessible :comment, :created_at, :post_id, :user_id
  belongs_to :user
  belongs_to :post
  has_many :commentvotes, :dependent => :destroy
  validates_presence_of :user_id, :post_id, :comment, :created_at
end
