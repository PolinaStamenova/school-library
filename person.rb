class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(params)
    @id = Random.rand(1..1000)
    @name = params[:name] || 'Unknown'
    @age = params[:age] # || raise("age parameter is required!") => it not gonna run the nothing until we do not pass into the new instace of class Person this parameter
    @parent_permission = params.fetch(:parent_permission, true)
    #@name = params[:parent_permission] || true ==> if no value is passed the first will be nil(not true) and we will take the "true" value after the || operator / default one
    # if we pass a atribute "false" to parent_permission it will take again the second default value "true"

  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    age >= 18
  end
end

# p Person.new.id
p polina = Person.new(parent_permission: true)

# In this case parent_permission needed to be passed to the person instance of class Person,
# because of the fetch method. We require this value to be true by default but it still should
# be passed to the initialized method to be given!!!
# If we want this value also to be optional, givven or not, then we need to do
# def initialize(params = {})

