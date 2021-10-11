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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json(*args)
  end
end
