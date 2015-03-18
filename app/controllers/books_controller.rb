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

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to root_path, notice: "Book updated"
    else
      @book = book
      flash[:notice] = "Unable to update book"
      render :edit
    end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to root_path, notice: "Book destroyed"
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
