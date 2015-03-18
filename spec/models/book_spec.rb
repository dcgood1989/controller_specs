require "rails_helper"

describe Book do
  describe "validations" do
    it "is invalid without a title" do
      book = Book.new(author: "Whatever")

      expect(book.valid?).to eq false
    end
  end

  describe ".find_for_title" do
    it "returns books for the given title" do
      book = create_book(title: "Harry Potter")
      create_book(title: "Lord of the Rings")

      expect(Book.find_for_title("Harry Potter")).to eq [book]
    end
  end

  describe "#title_and_author_stringer" do
    it "combines the title and author as a string" do
      book = create_book(title: "Harry Potter", author: "Some Muggle")

      expect(book.title_and_author_stringer).to eq "Harry Potter was written by Some Muggle"
    end
  end

  describe ".stringify_all_book_titles" do
    it "collects all the book titles and joins them with a comma" do
      create_book(title: "Harry Potter", author: "Some Muggle")
      create_book(title: "Lord of the Rings", author: "Some Wizard")

      expect(Book.stringify_all_book_titles).to eq "Harry Potter, Lord of the Rings"
    end
  end

  describe "#destroy_author" do
    it "sets the author to nil" do
      book = create_book(author: "Some smart writer")

      book.destroy_author
      expect(book.reload.author).to eq nil
    end
  end
end
