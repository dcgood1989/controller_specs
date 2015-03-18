def create_book(options={})
  defaults = {
    title: "Don Quixote",
    author: "Miguel de Cervantes"
  }
  Book.create!(defaults.merge(options))
end
