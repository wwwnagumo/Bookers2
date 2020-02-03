class UsersController < ApplicationController
  before_action :ensure_correct_user,{only: [:edit, :update]}
  def index
  	@users = User.all
  	@book = Book.new
  end
  def show
    @book_new = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "You have updated profile successfully."
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end
end
