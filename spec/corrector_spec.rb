require_relative 'spec_helper'

describe Corrector do
  describe '#correct_name' do
    corrector = Corrector.new

    it 'return capitalized and limited (max 10 char) string' do
      expect(corrector.correct_name('polinastamenova')).to match 'Polinastam'
    end

    it 'return capitalized and limited (max 10 char) string' do
      expect(corrector.correct_name(nil)).to be_nil
    end
  end
end
