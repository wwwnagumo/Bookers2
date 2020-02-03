class BooksController < ApplicationController
  before_action :ensure_correct_user,{only: [:edit, :update]}
  def top
  end

  def home
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      render action: :index
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  private
  def book_params
    params.require(:book).permit(:title, :body, :introduction, :user, :profile_image)
  end
  def ensure_correct_user
    @book = Book.find_by(id: params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end
end
