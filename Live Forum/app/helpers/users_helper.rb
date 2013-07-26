module UsersHelper

  def user_get_posts(user_id)
      Post.all(:conditions => {:user_id => user_id}).count
  end

  def user_get_votes_posts(user_id)
    count = 0
    @post = Post.all(:conditions => {:user_id => user_id})
    @post.each do |p|
      count += Vote.all(:conditions => {:post_id => p.id}).count
    end
    count
  end

  def user_get_comments_post(user_id)
    count = 0
    @post = Post.all(:conditions => {:user_id => user_id})
    @post.each do |p|
      count += p.commented
    end
    count
  end

  def user_get_comments_votes(user_id)
    count = 0
    @comments = Comment.all(:conditions => {:user_id => user_id})
    @comments.each do |c|
      count += Commentvote.all(:conditions => {:comment_id => c.id}).count
    end
    count
  end

  def user_post_voted(user_id)
    Vote.all(:conditions => {:user_id => user_id}).count
  end

  def user_total_comments(user_id)
    Comment.all(:conditions => {:user_id => user_id}).count
  end

  def user_comments_voted(user_id)
    Commentvote.all(:conditions => {:user_id => user_id}).count
  end
end
