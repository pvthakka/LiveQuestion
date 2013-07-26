class PostsController < ApplicationController
  before_filter :login_required, :except => [:search]
    def index
         @all_posts = Post.all(:order => "created_at")
    end

    def create
      @post = Post.new(params[:post])
      #@post.category = params[:category]
      @post.user_id = current_user.id
      @post.created_at = Time.now
      @post.commented = 0

      respond_to do |format|
       if @post.save
         format.html {redirect_to posts_path, :notice => "Post successfully submitted"}
      else
        format.html {redirect_to new_post_path, :notice => "Failed to submit post"}
      end
      end
    end

    def new
      @post = Post.new
      @category = Category.all
      respond_to do |format|
        format.html # new.html.erb
      end

    end

    def destroy
      @post = Post.find(params[:id])
      respond_to do |format|
      if @post.destroy
        format.html {redirect_to posts_path, :notice => "Post successfully deleted"}
      else
        format.html {redirect_to posts_path, :notice => "Failed to delete post"}
      end
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      respond_to do |format|
        if @post.update_attributes(params[:post], :category => params[:category], :created_at => Time.now)
          format.html {redirect_to posts_path, :notice => "Post successfully updated"}
        else
          format.html {redirect_to posts_path, :notice => "Failed to update post"}
        end
      end
    end

    def show
      @post = Post.find(params[:id])
      #if @post.commented == 1
        @comments = Comment.all(:conditions => {:post_id => @post.id}, :order => "created_at DESC")
        #@comment = Comment.all
      #end
    end

    def create_vote
      @vote = Vote.new(:post_id => params[:post_id], :user_id => current_user.id, :created_at => Time.now)
      respond_to do |format|
      if @vote.save
        @post = Post.find(params[:post_id])
        @post.update_attributes(:created_at => Time.now)
        format.html {redirect_to posts_path, :notice => "Voted for post successfully"}
      else
        format.html {redirect_to posts_path, :notice => "Failed to save vote"}
      end
      end
    end

    def search
      @search = params[:search]
      if @search == ""
        flash[:notice] = "Search terms cannot be blank!"
        redirect_to root_path
      else

      @results = Post.find_by_content(@search)

      @user = User.where("username LIKE ?", "%#{params[:search]}%")
      @user.each do |u|
        @post_user = Post.find_by_uid(u.id)
          @post_user.each do |p|
            @results << p
          end
      end
      @cats = Category.where("category LIKE ?", "%#{params[:search]}%")
      @cats.each do |c|
        @post_cat = Post.find_by_cid(c.id)
          @post_cat.each do |p|
            @results << p
          end
      end
      @results = @results.sort.uniq
      end
    end
end
