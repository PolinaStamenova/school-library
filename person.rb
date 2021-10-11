require_relative 'corrector'

class Person
  attr_reader :corrector, :rentals
  attr_accessor :name, :age, :id

  def initialize(params)
    @id = Random.rand(1..1000)
    @corrector = params[:corrector]
    @name = validate_name params[:name] || 'Unknown'
    @age = params[:age]
    @parent_permission = params.fetch(:parent_permission, true)
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    age >= 18
  end

  def validate_name(name)
    corrector.correct_name name
  end
end

# p Person.new(name: 'polinastamenova', corrector: Corrector.new)
