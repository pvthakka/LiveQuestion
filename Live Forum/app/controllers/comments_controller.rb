class CommentsController < ApplicationController
  def index

  end

  def edit
    @current_comment = Comment.find(params[:id])
    @current_post = Post.find(@current_comment.post_id)
  end

  def update
    @current_comment = Comment.find(params[:id])
    @current_post = Post.find(@current_comment.post_id)
    @current_comment.update_attributes(:comment => params[:comment], :created_at => Time.now)
    respond_to do |format|
    if @current_comment.update_attributes(:comment => params[:comment], :created_at => Time.now)
        @current_post.update_attributes(:created_at => Time.now)
      format.html {redirect_to post_path(@current_comment.post_id), :notice => "Comment successfully updated"}
    else
      format.html {redirect_to post_path(@current_comment.post_id), :notice => "Failed to update Comment"}
    end
   end
  end

  def new
    @new_comment = Comment.new
    @current_post = Post.find(params[:post_id])
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  def create
     @comment = Comment.new(:comment => params[:comment])
     @comment.user_id = session[:user_id]
     @current_post = Post.find(params[:post_id])
     @comment.post_id = @current_post.id
     @comment.created_at = Time.now

     respond_to do |format|
       if @comment.save
         @post = Post.find(params[:post_id])
         @post.update_attributes(:commented => 1, :created_at => Time.now)
         format.html {redirect_to post_path(@post), :notice => "Commented successfully"}
       else
         flash[:notice] = "Failed to submit comment"
         format.html {redirect_to :action => :new , :post_id => @current_post.id}
        end
     end
  end

  def create_vote
    @vote = Commentvote.new(:comment_id => params[:comment_id], :user_id => current_user.id, :created_at => Time.now)
    respond_to do |format|
      if @vote.save
        @comment = Comment.find(params[:comment_id])
        @comment.update_attributes(:created_at => Time.now)
        @post = Post.find(@comment.post_id)
        @post.update_attributes(:created_at => Time.now)
        format.html {redirect_to posts_path, :notice => "Voted for comment successfully"}
      else
        format.html {redirect_to posts_path, :notice => "Failed to vote comment"}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    respond_to do |format|
    if @comment.destroy
      @post.update_attributes(:created_at => Time.now, :commented => 0)
      format.html {redirect_to :back, :notice => "Comment successfully deleted"}
    else
      format.html {redirect_to :back, :notice => "Comment to delete post"}
    end
    end
  end
end
