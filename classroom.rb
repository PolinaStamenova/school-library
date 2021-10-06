require_relative "student"

class Classroom
  #has_many : students
  attr_accessor :label, :student
  attr_reader :students

  def initialize(params)
    @label = params[:label]
    # @student = params[:student]
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

classroom_122 = Classroom.new(label: 122)
classroom_122.add_student(Student.new(name: "polina", corrector: Corrector.new))
classroom_122.add_student(Student.new(name: "marina", corrector: Corrector.new))
p classroom_122.students









# student_1 = Student.new(name: "polina", corrector: Corrector.new)
# student_2 = Student.new(name: "marina", corrector: Corrector.new)

# classroom_122 = Classroom.new(label: 122, student: Student.new(name: "polina", corrector: Corrector.new))


# classroom.add_student(student_1)
# classroom.add_student(student_2)
# classroom_122.add_student(student_1)
# classroom_122.students
# classroom_122.add_student(student_2)
# p classroom.students
# p classroom.students.map { |student| student.classroom}

# p classroom.students.count
# p classroom.students.last.classroom

# p classroom_122.students.last.classroom.label
# p student_1.classroom
# p student_2.classroom = classroom_122
# p student_2.classroom.label




