class Book < ActiveRecord::Base
  validates :title, presence: true


  def self.find_for_title(title)
    Book.where(title: title)
  end

  def title_and_author_stringer
    "#{self.title} was written by #{self.author}"
  end

  def self.stringify_all_book_titles
    # Book.all.map do |book|
    #   book.title
    # end.join(', ')

    # Book.all.map { |book| book.title }.join(", ")

    Book.all.map(&:title).join(", ")

    # result = ""
    #
    # Book.all.each do |book|
    #   result << book.title + ", "
    # end
    # result = result[0...-2]
    # result
  end

  def destroy_author
    self.author = nil
    self.save
  end
end
