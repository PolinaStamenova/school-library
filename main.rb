require_relative "person"
require_relative "student"
require_relative "teacher"



class App
  def initialize
    @classroom = Classroom.new('Microverse 2.0')
    @people = []
    @books = []
    @rentals = []
  end

  def run
    puts "Welcome to School Library App!"
    puts
    print options
    option = gets.chomp
    case_options(option)
  end

  def case_options(option)
      case option
    when "1"
      puts "One"
    when "2"
      puts "Two"
    when "3"
      puts "Three"
    when "4"
      puts "four"
    when "5"
      puts "Five"
    when "6"
      puts "Six"
    else
      puts "Exit"
    end
  end

  def options
    puts "Please choose an option by enterin a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given preson id"
    puts "7 - Exit"
  end
end

def main
  app = App.new()
  app.run
end

main()