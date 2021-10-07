require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'corrector'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    puts 'Welcome to School Library App!'
    sleep 1
    options
  end

  def case_options(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental_by_person_id
    else
      puts 'Exit'
    end
  end

  def list_books
    puts 'There are no books' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 1
    options
  end

  def list_people
    puts 'There are no people' if @people.empty?

    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    sleep 1
    options
  end

  def parent_permission?
    answer = ''
    until %w[y n].include?(answer)
      print 'Has parent permission? [Y/N]: '
      answer = gets.chomp.downcase
    end
    answer == 'y'
  end

  def choose_person
    answer = ''
    until %w[1 2].include?(answer)
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      answer = gets.chomp.downcase
    end
    answer
  end

  def specialization
    answer = ''
    while answer&.empty?
      print 'Specialization: '
      answer = gets.chomp
    end
  end

  def create_person
    option = choose_person

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp
    person = case option
             when '1'
               Student.new(age: age, name: name, parent_permission: parent_permission?, corrector: Corrector.new)
             when '2'
               Teacher.new(age: age, name: name, specialization: specialization, corrector: Corrector.new)
             end
    @people << person
    puts 'Person created successfully'
    sleep 1
    options
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    book = Book.new(title: title, author: author)
    @books << book
    puts 'Book created successfully'
    sleep 1
    options
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }

    book_idx = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, idx|
      puts "#{idx}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_idx = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date: date, book: @books[book_idx], person: @people[person_idx])

    @rentals << rental
    puts 'Rental created successfully'
    sleep 1
    options
  end

  def list_rental_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    puts
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end

    sleep 1
    options
  end

  def options
    puts
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given preson id'
    puts '7 - Exit'
    option = gets.chomp
    case_options option
  end
end

App.new.run
