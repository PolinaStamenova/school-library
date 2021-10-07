require_relative "person"
require_relative "student"
require_relative "teacher"
require_relative "corrector"


class App
  def initialize
    # @classroom = Classroom.new('Microverse 2.0')
    @people = []
    # @books = []
    # @rentals = []
  end

  def run
    puts "Welcome to School Library App!"
    puts options

  end

  def case_options(option)
      case option
    when "1"
      puts "One"
    when "2"
      puts "Two"
    when "3"
      option_three
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

  def option_three
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    choose_person = gets.chomp
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    if choose_person == "1"
      print "Has parent permission? [Y/N]: "
      parent_permission = gets.chomp.downcase
      if parent_permission == "y"
        parent_permission = true
      elsif parent_permission == "n"
        parent_permission = false
      end
      student = Student.new(age: age, name: name, parent_permission: parent_permission, corrector: Corrector.new)
      @people << student
      # p @people
    elsif choose_person == "2"
      print "Specialization: "
      specialization = gets.chomp
      teacher = Teacher.new(age: age, name: name, specialization: specialization, corrector: Corrector.new)
      @people << teacher
      # p @people
    end
    puts "Person created successfully"
    puts options
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
    case_options(option)
  end
end

def main
  app = App.new()
  app.run
end

main()