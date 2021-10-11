require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'corrector'
require_relative 'book'
require_relative 'rental'
require_relative 'create_book'
require_relative 'create_person'
require_relative 'options'
require_relative 'list_people'
require_relative 'list_books'
require_relative 'create_rental'
require_relative 'list_rentals'
require_relative "storage"

class App
  include Options

  attr_accessor :people, :books

  def initialize
    @storage = Storage.new
    @books = @storage.parse[:books]
    @people = @storage.parse[:people]
    @rentals = @storage.parse[:rentals]
    @book_creator = CreateBook.new(@books)
    @people_creator = CreatePerson.new(@people)
    @book_list = BookList.new(@books)
    @people_list = PeopleList.new(@people)
    @rental_creator = CreateRental.new({ rentals: @rentals, people: @people, books: @books })
    @rentals_list = RentalsList.new(@rentals)
  end

  def run
    is_running = true
    while is_running
      options
      option = gets.chomp
      if option.eql?('7')
        @storage.stringify(@books, @people, @rentals)
        is_running = false
      else
        case_options(option)
      end
    end
  end

  def case_options(option)
    case option
    when '1'
      @book_list.list_books
    when '2'
      @people_list.list_people
    when '3'
      @people_creator.create_person
    when '4'
      @book_creator.create_book
    when '5'
      @rental_creator.create_rental
    when '6'
      @rentals_list.list_rental_by_person_id
    else
      puts 'Exit'
    end
  end
end

App.new.run
