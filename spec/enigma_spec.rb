require './enigma'
require 'simplecov'

describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  describe '#initialize' do
    it 'returns an instance of Enigma' do
      expect(@enigma).to be_a Enigma
    end
  end
end 
