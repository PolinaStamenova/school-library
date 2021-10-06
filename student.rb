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
end
