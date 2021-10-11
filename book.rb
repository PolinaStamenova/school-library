class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(params)
    @title = params[:title]
    @author = params[:author]
    @rentals = []
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end
end
