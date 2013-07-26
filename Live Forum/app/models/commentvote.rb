class Commentvote < ActiveRecord::Base
  attr_accessible :comment_id, :created_at, :user_id
  belongs_to :comment
  belongs_to :user
end
