class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.admin = 0
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to_target_or_default :controller => '/posts', :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end

  def show
    @usr = User.find(params[:id])

  end

  def index
    @users = User.all
    @category = Category.all
  end

  def delete_user
     @user = User.find(params[:user_id])
     if @user.destroy
       redirect_to users_path, :notice => "User deleted."
     else
       redirect_to users_path, :notice => "Unable to delete user."
     end
  end

  def make_admin
    @user = User.find(params[:user_id])
    if @user.update_attributes(:admin => 1)
      redirect_to users_path, :notice => "User has been made admin."
    else
      redirect_to users_path, :notice => "Unable to save user."
    end
  end

  def revoke_admin
    @user = User.find(params[:user_id])
    if @user.update_attributes(:admin => 0)
      redirect_to users_path, :notice => "User has been revoked admin rights."
    else
      redirect_to users_path, :notice => "Unable to save user."
    end
  end

  def add_category
    @category = Category.new
    @category.category = params[:new]
    if @category.save
      redirect_to users_path, :notice => "Category has been added."
    else
      redirect_to users_path, :notice => "Failed to add category."
    end
  end

  def delete_category
    @category = Category.find(params[:category_id])
    #@category = Category.where("category LIKE ?", "%#{params[:category_name]}%")
    #@category = Category.where(:category => params[:category_name])
    if @category.destroy
      redirect_to users_path, :notice => "Category has been deleted."
    else
      redirect_to users_path, :notice => "Unable to delete category."
    end
  end

  def report
    @users = User.all
  end
end
