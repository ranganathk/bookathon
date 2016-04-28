class ChaptersController < ApplicationController
  before_action :fetch_book
  before_action :fetch_chapter, only: [:show, :edit, :update, :destroy]

  def new
    @chapter = @book.chapters.new
  end

  def create
    @chapter = @book.chapters.new(chapter_params)
    if @chapter.save
      redirect_to book_chapters_path(@book, @chapter)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @chapter.update_attributes(chapter_params)
      redirect_to book_chapters_path(@book, @chapter)
    else
      render :edit
    end
  end

  def index
    @chapters = @book.chapters.all
  end

  def destroy
    @chapter.destroy
    redirect_to book_chapters_path(@book)
  end

  private

    def fetch_book
      @book = Book.find(params[:book_id])
    end

    def fetch_chapter
      @chapter = @book.chapters.find(params[:id])
    end

    def chapter_params
      params.require(:chapter).permit(:title)
    end
end
