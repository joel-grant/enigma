require 'date'
require './lib/enigma'

describe Enigma do
  let(:enigma) { Enigma.new }
  let(:encrypt_return) { { encryption: "hello world", key: "02715", date: "040895" } }
  before(:each) do
  end

  describe '#initialize' do
    it 'returns an instance of Enigma' do
      expect(enigma).to be_a Enigma
    end

    it 'can return and contain the open .txt file' do

    end
  end

  describe '#encrypt' do
    it 'returns a hash containing the encrypted text, the key and the date' do
      # allow(enigma).to receive(:encrypt).and_return({encryption: "hello world", key: "02715", date: "040895"})
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(encrypt_return)
    end

  end

  describe '#decrypt' do
  end
end
