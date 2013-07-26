module CommentsHelper
  def can_vote_comment?(comment_id)
    @votes = Commentvote.all(:conditions => {:comment_id => comment_id})
    @votes.each do |v|
      if v.user_id == session[:user_id]
        return false
      end
    end
    return true
  end

  def num_votes_comment(comment_id)
    @votes = Commentvote.all(:conditions => {:comment_id => comment_id})
    @votes.count
  end

  def get_votes_comment(comment_id)
    @votes = Commentvote.all(:conditions => {:comment_id => comment_id})
  end
end
