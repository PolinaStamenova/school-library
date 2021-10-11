require_relative "rental"

class CreateRental
  attr_accessor :rentals

  def initialize(params)
    @rentals=params[:rentals]
    @books=params[:books]
    @people=params[:people]
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
  end
end