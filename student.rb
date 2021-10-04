require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(params)
    super
    @classroom = params[:classroom]
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
