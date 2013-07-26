class Vote < ActiveRecord::Base
  attr_accessible :created_at, :post_id, :user_id
  belongs_to :user
  belongs_to :post
end
