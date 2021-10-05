require_relative "corrector"

class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(params)
    @id = Random.rand(1..1000)
    @name = params[:name] || 'Unknown'
    @age = params[:age]
    @parent_permission = params.fetch(:parent_permission, true)
    # @correct_name = Corrector.new()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    corrector = Corrector.new
    @name = corrector.correct_name @name
  end

  private

  def of_age?
    age >= 18
  end
end

p person = Person.new(name: "polinakjsaklsjaklsjakls")
p person.validate_name
p person.name