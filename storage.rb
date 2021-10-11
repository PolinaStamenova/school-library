require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class Storage
  def stringify(book, people, rentals)
    File.open('books.json', 'w') { |f| f.write JSON.generate(book) }
    File.open('people.json', 'w') { |f| f.write JSON.generate(people) }
    File.open('rentals.json', 'w') { |f| f.write JSON.generate(rentals) }
  end
end
