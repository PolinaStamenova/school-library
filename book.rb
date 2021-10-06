class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(params)
    @title = params[:title]
    @author = params[:author]
    @rentals = []
  end
end
