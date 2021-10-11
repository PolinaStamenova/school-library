require_relative 'corrector'
require_relative 'options'

class CreatePerson
  attr_accessor :people

  def initialize(params)
    @people = params
  end

  def parent_permission?
    answer = ''
    until %w[y n].include?(answer)
      print 'Has parent permission? [Y/N]: '
      answer = gets.chomp.downcase
    end
    answer == 'y'
  end

  def specialization
    answer = ''
    while answer&.empty?
      print 'Specialization: '
      answer = gets.chomp
    end
  end

  def choose_person
    answer = ''
    until %w[1 2].include?(answer)
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      answer = gets.chomp.downcase
    end
    answer
  end

  def create_person
    option = choose_person

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp
    person = case option
             when '1'
               Student.new(age: age, name: name, parent_permission: parent_permission?, corrector: Corrector.new)
             when '2'
               Teacher.new(age: age, name: name, specialization: specialization, corrector: Corrector.new)
             end
    @people << person
    puts 'Person created successfully'
  end
end
