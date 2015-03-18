require "rails_helper"

describe BooksController do
  describe "GET #index" do
    it "assigns all books with a title of Harry Potter" do
      book = create_book(title: "Harry Potter")
      create_book(title: "Lord of the Rings")

      get :index

      expect(assigns(:books)).to eq [book]
    end
  end

  describe "GET #new" do
    it "assigns a new Book object" do
      get :new

      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "POST #create" do
    describe "on success" do
      it "creates a new book when valid parameters are passed" do
        expect {
          post :create, book: { title: "Harry Potter", author: "Some Muggle" }
        }.to change { Book.all.count }.from(0).to(1)

        book = Book.last
        expect(book.title).to eq "Harry Potter"
        expect(book.author).to eq "Some Muggle"
        expect(flash[:notice]).to eq "Book created"
        expect(response).to redirect_to books_path
      end
    end

    describe "on failure" do
      it "does not create a book if it is invalid" do
        expect {
          post :create, book: { title: nil, author: "Some Muggle" }
        }.to_not change { Book.all.count }

        expect(flash[:notice]).to eq "Something went wrong"
        expect(response).to render_template(:new)
      end
    end
  end
end
