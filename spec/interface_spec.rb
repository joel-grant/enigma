require 'spec_helper'
require 'date'
require './lib/enigma'
require './lib/interface'


describe Interface do
  let(:message) { "hello world" }
  let(:in_file) { "encrypted.txt" }
  let(:out_file) { "encrypted.txt" } #fix the fact that these two files have to be the same.  its a little goofy
  let(:encryption) { { encryption: "keder ohulw", key: "02715", date: "040895" } }
  let(:decryption) { { encryption: "hello world", key: "02715", date: "040895"}}

  before(:each) do
    @interface = Interface.new(message, [in_file, out_file, "02715", "040895"])
    @enigma = Enigma.new
  end

  describe '#initialize' do
    it 'contains returns an instance of Interface' do
      expect(@interface).to be_a Interface
    end

    it 'returns the file to read ' do
      expect(@interface.in_file).to eq('encrypted.txt')
    end

    it 'contains the text from the open file' do
      expect(@interface.message).to eq(message)
    end

    it 'contains the new Enigma object' do
      expect(@interface.enigma).to be_a Enigma
    end

    it 'returns the file to write' do
      expect(@interface.out_file).to eq("encrypted.txt")
    end

    it 'returns the key, if there is one provided' do
      expect(@interface.key).to eq("02715").or nil
    end

    it 'returns the date, if there is one provided' do
      expect(@interface.date).to eq("040895").or nil
    end
  end

  describe '#start_enigma_encryption' do
    it 'returns the appropriate hash' do
      expect(@interface.start_enigma_encryption).to be_a Hash
    end
    it 'has a hash with a key that is 5 digits long' do
      expect(@interface.start_enigma_encryption[:key].length).to eq(5)
    end
    it 'has a hash with a date that is 6 digits long' do
      expect(@interface.start_enigma_encryption[:date].length).to eq(6)
    end
  end

  describe '#start_enigma_decryption' do
    it 'returns a hash' do
      expect(@interface.start_enigma_decryption).to be_a Hash
    end
    it 'has a hash with a key that is 5 digits long' do
      expect(@interface.start_enigma_decryption[:key].length).to eq(5)
    end
    it 'has a hash with a date that is 6 digits long' do
      expect(@interface.start_enigma_decryption[:date].length).to eq(6)
    end
    it 'returns the decrypted hash' do
      @interface.message = encryption[:encryption]
      @interface.key = encryption[:key]
      @interface.date = encryption[:date]
      expect(@interface.start_enigma_decryption).to eq(decryption)
    end
  end
end
