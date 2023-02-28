class UsersController < ApplicationController
  before_action :current_user, only: [ :edit] 
  before_action :is_matching_login_user, only: [:edit, :update] 
  
  def create
    @user=User.new(user_params)
    @user.user_id=current_user.id
    @user.save
    flash[:notice] = "Signed in successfully."
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @book_comment = BookComment.new
  end

  def index
    @users = User.all
    @user=current_user
    @book = Book.new
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
     
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      @users = User.all
      render "edit"
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  #def ensure_correct_user
    #@user = User.find(params[:id])
    #unless @user == current_user
      #redirect_to user_path(current_user)
    #end
    
     def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end