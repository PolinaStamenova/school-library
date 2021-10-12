require_relative 'spec_helper'

describe Person do
  describe '#new' do
    let(:person) { Person.new({ age: 16 }) }
    context 'when person is instantiated with only age' do
      it 'should return an instance of Person' do
        expect(person).to be_an_instance_of Person
        expect(person).to be_instance_of Person
        expect(person).to be_kind_of Person
      end

      it 'should have respond to id' do
        expect(person).to respond_to(:id)
      end

      it 'should have parent_permission default to true' do
        expect(person.parent_permission).to be_truthy
      end
      it 'should respond to parent_permission' do
        expect(person).to respond_to(:parent_permission)
      end

      it 'should have name default to Unknown' do
        expect(person.name).to eq 'Unknown'
      end
      it 'should respond to name' do
        expect(person).to respond_to(:name)
      end

      it 'should respond to rentals' do
        expect(person).to respond_to(:rentals)
      end
      it 'should have rentals attribute' do
        expect(person).to have_attributes(rentals: [])
      end
    end

    context 'when person is instantiated with all parameters' do
      let(:person) { Person.new({ age: 16, name: 'Polina', parent_permission: false }) }
      it 'should return an instance of Person' do
        expect(person).to be_an_instance_of Person
      end

      it 'should have parent_permission return false' do
        expect(person.parent_permission).to be_falsey
      end

      it 'should have name return Polina' do
        expect(person.name).to eq 'Polina'
      end
    end
  end

  describe '#can_use_services' do
    context 'when person is above 18' do
      it 'should be allowed' do
        person = Person.new({ age: 21, name: 'Olawale', parent_permission: true })
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when person is below 18' do
      it 'should not be allowed' do
        person = Person.new({ age: 12, name: 'Olawale', parent_permission: false })
        expect(person.can_use_services?).to be_falsey
      end

      it 'should be allowed with parent permission' do
        person = Person.new({ age: 14, name: 'Olawale', parent_permission: true })
        expect(person.can_use_services?).to be_truthy
      end
    end
  end
end
