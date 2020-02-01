class BooksController < ApplicationController
  def top
  end

  def home
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end
end
