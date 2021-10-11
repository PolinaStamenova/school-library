class BookList
  attr_accessor :books

  def initialize(params)
    @books = params
  end

  def list_books
    puts 'There are no books' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end
end
