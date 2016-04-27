class BooksController < ApplicationController
  before_action :fetch_book, only: [:show, :edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit  
  end

  def update
    if @book.update_attributes(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :description)
    end

    def fetch_book
      @book = Book.find(params[:id])
    end
end
