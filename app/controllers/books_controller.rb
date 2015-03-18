class BooksController < ApplicationController
  def index
    @books = Book.find_for_title("Harry Potter")
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_path, notice: "Book created"
    else
      @book = book
      flash[:notice] = "Something went wrong"
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
