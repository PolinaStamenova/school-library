require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(params)
    super
    @classroom = params[:classroom]
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'classroom' => @classroom,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end
