class PeopleList
  attr_accessor :people

  def initialize(params)
    @people=params
  end

  def list_people
    puts 'There are no people' if @people.empty?

    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }

  end
end