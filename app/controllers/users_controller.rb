class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def index_follow
    @user = User.find(params[:id])
    @users = @user.follower
    render 'index_follow'
  end

  def index_follower
    @user = User.find(params[:id])
    @users = @user.followed
    render 'index_follower'
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  	@books = @user.books
  end

  def edit
      @user = User.find(params[:id])
      if @user == current_user
         render "edit"
      else
         redirect_to user_path(current_user)
      end
  end

  def update
  	  @user = User.find(params[:id])
  	  if @user.update(user_params)
  	  redirect_to user_path(@user.id), notice: "You have updated user successfully."
      else 
      render "edit"
      end
  end

  private
  def user_params
  	  params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end