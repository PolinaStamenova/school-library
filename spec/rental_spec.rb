require_relative 'spec_helper'

describe Rental do
  describe '#new' do
    classroom = Classroom.new(label: 'Science')
    student = Student.new(age: 23, name: 'Polina', classroom: classroom)
    teacher = Teacher.new(age: 43, name: 'Vichuge', specialization: 'literature')
    book = Book.new({ title: 'Sun Tzu', author: 'Art of war' })

    rental1 = Rental.new({ date: '2020-01-12', book: book, person: student })
    rental2 = Rental.new({ date: '2020-10-12', book: book, person: teacher })

    it 'should return an instance of Rental' do
      expect(rental1).to be_an_instance_of Rental
      expect(rental2).to be_an_instance_of Rental
    end

    it 'should return date to be 2020-01-12 for rental1' do
      expect(rental1.date).to eq '2020-01-12'
    end

    it 'should return date to be 2020-10-12 for rental2' do
      expect(rental2.date).to eq '2020-10-12'
    end

    it 'should return person to be student' do
      expect(rental1.person).to eq student
      expect(rental1.person).to be_an_instance_of Student
      expect(rental1.person).to be_kind_of Person
    end

    it 'should return person to be teacher' do
      expect(rental2.person).to eq teacher
      expect(rental2.person).to be_an_instance_of Teacher
      expect(rental2.person).to be_kind_of Person
    end

    it 'should return book to be book' do
      expect(rental1.book).to eq book
    end

    context '#person' do
      it 'should have the rentals include rental1' do
        expect(student.rentals).to include(rental1)
      end
      it 'should have the rentals include rental2' do
        expect(teacher.rentals).to include(rental2)
      end
    end

    context '#book' do
      it 'should have the rentals include rental1 and rental2' do
        expect(book.rentals).to include(rental1)
        expect(book.rentals).to include(rental2)
      end

      it 'should have the rentals size greater than 1' do
        expect(book.rentals.size).to be > 1
      end
    end
  end
end
