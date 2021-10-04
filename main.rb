class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # attr_accessor :id
  # attr_accessor :name
  # attr_accessor :age

  # Attributes readers/setters  => attr_reader :name
  def id
    @id = id
  end

  def name
    @name = name
  end

  def age
    @age = age
  end

 # Attributes writers/getters  => attr_writer :name
  def id = (id)
    @id = id
  end

  def name = (name)
    @name = name
  end

  def age = (age)
    @age = age
  end

  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end
end
