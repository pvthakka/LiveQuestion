class CommentvotesController < ApplicationController
  def show
    @votes = Commentvote.all(:conditions => {:comment_id => params[:comment_id]})
  end
end
