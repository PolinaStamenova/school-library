class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(params)
    @id = Random.rand(1..1000)
    @name = params[:name] || 'Unknown'
    @age = params[:age]
    @parent_permission = params.fetch(:parent_permission, true)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    age >= 18
  end
end
