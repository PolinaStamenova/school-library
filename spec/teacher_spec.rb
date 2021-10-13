require_relative 'spec_helper'

describe Teacher do
  describe '#new' do
    context 'When giving specialization' do
      let(:teacher) { Teacher.new(specialization: "Maths") }
      it 'should return an instance of Teacher' do
        expect(teacher).to be_an_instance_of Teacher
      end

      it 'should return kind/subclass of Person' do
        expect(teacher).to be_kind_of Person
      end
    end
  end

  describe "#can_use_services?" do
    context '#can_use_services?' do
      let(:teacher) { Teacher.new(specialization: "Maths") }
      it 'Should return true' do
        expect(teacher.can_use_services?).to be_truthy
      end
    end
  end
end
