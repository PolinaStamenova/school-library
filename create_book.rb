require_relative 'options'

class CreateBook
  include Options
  attr_accessor :books

  def initialize(params)
    @books = params
  end

  def create_book
    title, author = create_book_screen
    book = Book.new(title: title, author: author)
    @books << book
    puts 'Book created successfully'
  end
end
