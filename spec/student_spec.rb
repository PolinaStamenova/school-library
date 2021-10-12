require_relative 'spec_helper'

describe Student do
  describe '#new' do
    let(:classroom) { Classroom.new({ label: 'Chemie' }) }
    let(:student) { Student.new({ age: 15, classroom: classroom.label }) }

    context 'Student instance' do
      it 'should return an instance of Student' do
        expect(student).to be_an_instance_of Student
      end

      it 'should return kind/subclass of Person' do
        expect(student).to be_kind_of Person
      end
    end

    it 'Should add a student to the classroom' do
      expect(student.classroom).to eq classroom.label
    end

    context '#play_hooky' do
      it "Should return ¯\(ツ)/¯" do
        expect(student.play_hooky).to eq "¯\(ツ)/¯"
      end
    end
  end
end
