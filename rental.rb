class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(params)
    @date = params[:date]

    @book = params[:book]
    book.rentals << self

    @person = params[:person]
    person.rentals << self
  end
end
