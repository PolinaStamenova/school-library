require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'corrector'

class Storage
  def stringify(book, people, rentals)
    File.open('books.json', 'w') { |f| f.write JSON.generate(book) }
    File.open('people.json', 'w') { |f| f.write JSON.generate(people) }
    File.open('rentals.json', 'w') { |f| f.write JSON.generate(rentals) }
  end

  def parse
    {
      books: parse_books,
      people: parse_people,
      rentals: parse_rentals(parse_people, parse_books)
    }
  end

  def parse_books
    file_name = 'books.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |book|
      Book.new(title: book['title'], author: book['author'])
    end
  end

  def parse_people
    file_name = 'people.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |people|
      if people['json_class'].eql?('Teacher')
        create_teacher people
      else
        create_student people
      end
    end
  end

  def parse_rentals(people, books)
    file_name = 'rentals.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |rental|
      person = people.detect { |p| p.id.eql?(rental['person']['id']) }
      book = books.detect { |b| b.title.eql?(rental['book']['title']) }
      Rental.new({ date: rental['date'], person: person, book: book })
    end
  end

  private

  def create_teacher(people)
    teacher = Teacher.new(age: people['age'],
                          name: people['name'],
                          specialization: people['specialization'],
                          corrector: Corrector.new)
    teacher.id = people['id']
    teacher
  end

  def create_student(people)
    age = people['age']
    name = people['name']
    classroom = people['classroom']
    permission = people['parent_permission']
    student = Student.new(age: age,
                          name: name,
                          classroom: classroom,
                          parent_permission: permission,
                          corrector: Corrector.new)
    student.id = people['id']
    student
  end
end
