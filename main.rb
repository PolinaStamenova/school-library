require_relative "person"
require_relative "student"
require_relative "teacher"
require_relative "corrector"
require_relative "book"


class App
  def initialize
    # @classroom = Classroom.new('Microverse 2.0')
    @people = []
    @books = []
    # @rentals = []
  end

  def run
    puts "Welcome to School Library App!"
    sleep 1
    options

  end

  def case_options(option)
    case option
    when "1"
      list_books
    when "2"
      list_people
    when "3"
      create_person
    when "4"
      create_book
    when "5"
      puts "Five"
    when "6"
      puts "Six"
    else
      puts "Exit"
    end
  end

  def list_books
    puts "There are no books" if @books.empty?

    @books.each {|book| puts "Title: #{book.title}, Author: #{book.author}"}
    sleep 1
    options
  end

  def list_people
    puts "There are no people" if @people.empty?

    @people.each {|person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
    sleep 1
    options
  end

  def parent_permission?
    answer = ""
    until answer == "y" || answer == "n"
      print "Has parent permission? [Y/N]: "
      answer = gets.chomp.downcase
    end
    answer == "y" ? true : false
  end

  def choose_person
    answer = ""
    until answer == "1" || answer == "2"
      print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
      answer = gets.chomp.downcase
    end
    answer
  end

  def specialization
    answer = ""
    while answer&.empty?
      print "Specialization: "
      answer = gets.chomp
    end
  end

  def create_person
    option = choose_person

    print "Age: "
    age = gets.chomp.to_i

    print "Name: "
    name = gets.chomp
    person =  if option == "1"
                Student.new(age: age, name: name, parent_permission: parent_permission?, corrector: Corrector.new)
              elsif option == "2"
                Teacher.new(age: age, name: name, specialization: specialization, corrector: Corrector.new)
              end
    @people << person
    puts "Person created successfully"
    sleep 1
    options
  end

  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp
    book = Book.new(title: title, author: author)
    @books << book
    puts "Book created successfully"
    sleep 1
    options
  end

  def options
    puts
    puts "Please choose an option by enterin a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given preson id"
    puts "7 - Exit"
    option = gets.chomp
    case_options option
  end
end

App.new.run