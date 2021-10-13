require_relative 'spec_helper'

describe Classroom do
  let(:classroom) { Classroom.new({ label: 'Chemie' }) }
  let(:student) { Student.new({ age: 17, classroom: classroom }) }


  describe '#new' do
    it 'Should return an instance of Classroom' do
      expect(classroom).to be_an_instance_of Classroom
    end
  end

  describe 'classroom label' do
    it 'Should return label of the classroom equal to Chemie' do
      expect(classroom.label).to match 'Chemie'
    end
  end

  describe '#add_student' do
    before do
      classroom.add_student student
    end

    it 'Should add student to Classroom' do
      expect(classroom.students).to include(student)
    end

    it 'should be in the correct classroom' do
      expect(student.classroom).to eq classroom
    end
  end
end
