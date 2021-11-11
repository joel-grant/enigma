require './lib/enigma'

describe Enigma do
  before(:each) do
    @enigma = Enigma.new
    require 'pry'; binding.pry
  end

  describe '#initialize' do
    it 'returns an instance of Enigma' do
      require 'pry'; binding.pry
      expect(@enigma).to be_a Enigma
    end
  end

  describe '#encrypt' do

  end

  describe '#decrypt' do

  end

end
