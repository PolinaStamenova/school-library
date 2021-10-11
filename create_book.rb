class CreateBook
  attr_accessor :books

  def initialize (params)
    @books=params
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    book = Book.new(title: title, author: author)
    @books << book
    puts 'Book created successfully'

  end
end