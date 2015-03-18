class Book < ActiveRecord::Base
  validates :title, presence: true


  def self.find_for_title(title)
    Book.where(title: title)
  end
end
