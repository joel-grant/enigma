require 'spec_helper'
require 'date'
require './lib/enigma'
require './lib/interface'


describe Interface do
  let(:message) { "hello world" }
  let(:out_file) { "encrypted.txt" }
  let(:in_file) { "outfile.txt" }
  let(:encryption) { { encryption: "keder ohulw", key: "02715", date: "040895" } }

  before(:each) do
    @file = File.open('message.txt', 'r')
    @interface = Interface.new(message, [in_file, out_file])
    @enigma = Enigma.new
  end

  describe '#initialize' do
    it 'contains returns an instance of Interface' do
      expect(@interface).to be_a Interface
    end

    it 'returns the file to read ' do
      expect(out_file).to eq('encrypted.txt')
    end

    it 'contains the text from the open file' do
      expect(@interface.message).to eq(message)
    end
  end

  # describe '#start_enigma' do
  #   it 'returns the appropriate hash' do
  #     expect(@interface.start_enigma(message, "02715", "040895")).to eq({ encryption: "keder ohulw", key: "02715", date: "040895" })
  #   end
  # end

  describe '#display_encryption' do
    it 'returns the hash that is used to display the output' do
      expect(@interface.display_encryption({ encryption: "keder ohulw", key: "02715", date: "040895" })).to eq("Created 'encrypted.txt' with the key 02715 and date 040895")
    end
  end

  # describe '#write_to_file' do
  #   it 'writes the encrypted text to the file' do
  #     file_1 = File.open("encrypted.rb", 'r')
  #     text = file_1.read
  #     expect(@interface.write_to_file(encryption)).to eq(text)
  #   end
  # end
end
