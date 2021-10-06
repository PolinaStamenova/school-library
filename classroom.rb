class Classroom
  attr_accessor :label, :student
  attr_reader :students

  def initialize(params)
    @label = params[:label]
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

