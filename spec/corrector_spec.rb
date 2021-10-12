require_relative "spec_helper"

describe Corrector do
  describe "#correct_name" do
    corrector = Corrector.new
    person = Person.new({ name: "polinastamenova", corrector: corrector })

    it "return capitalized and limited (max 10 char) string" do
      expect(corrector.correct_name(person.name)).to eq 'Polinastam'
    end
  end
end