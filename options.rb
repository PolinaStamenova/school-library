module Options
  def options
    puts "Welcome to School Library App!\n\n"
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given preson id'
    puts '7 - Exit'
  end

  def create_book_screen
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_person_screen
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp
    [age, name]
  end

  def console(text)
    puts text
  end
end
