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
end
