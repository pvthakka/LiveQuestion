class Post < ActiveRecord::Base
  attr_accessible :category, :created_at, :message, :user_id, :commented, :category_id
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  validates_presence_of :user_id, :message, :created_at, :category_id
  belongs_to :category
  #serialize :message, :category

  def self.find_by_content(content)
    #Post.all(:conditions => ["message like ?", "%#{content}%"])
    Post.where("message LIKE ?", "%#{content}%" )
  end

  def self.find_by_uid(user_id)
    Post.all(:conditions => {:user_id => user_id})
  end

  def self.find_by_cid(category_id)
    Post.all(:conditions => {:category_id => category_id})
  end
end
