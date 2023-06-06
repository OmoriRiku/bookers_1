class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  
  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  def update
    if @book.update(books_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end
  
  private
  
  def set_book
    @book = Book.find(params[:id])
  end
  
  def books_params
    params.require(:book).permit(:title, :body)
  end
end
