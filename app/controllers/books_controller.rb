class BooksController < ApplicationController
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
    book = Book.find(book_params)
    book.save
    redirect_to book_path
  end

  def show
    book = User.find(params[:id])
  end

  def edit
    book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  private
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
