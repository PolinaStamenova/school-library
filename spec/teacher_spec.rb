require_relative "spec_helper"

describe Teacher do
  describe "#new" do
    let(:teacher) { Teacher.new({ specialization: "Maths" }) }

    context "Teacher instaned" do
      it "should return an instance of Teacher" do
        expect(teacher).to be_an_instance_of Teacher
      end

      it "should return kind/subclass of Person" do
        expect(teacher).to be_kind_of Person
      end
    end

    context "#can_use_services?" do
      it "Should return true" do
        expect(teacher.can_use_services?).to be_truthy
      end
    end
  end
end