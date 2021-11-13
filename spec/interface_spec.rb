require 'spec_helper'
require 'date'
require './lib/enigma'
require './lib/interface'


describe Interface do
  let(:message) { "Mr. Rocky Mountain Wrinkleton" }
  let(:args) { ARGV }

  before(:each) do
    @file = File.open('message.txt', 'r')
    @test = @file.read
    # @args = ARGV
    @interface = Interface.new(ARGV[0], ARGV[1])
    @enigma = Enigma.new
    require 'pry'; binding.pry
  end

  describe '#initialize' do
    it 'contains and returns the file name to read' do
      expect(@interface).to be_a Interface
    end

    it 'returns the file to read' do
      expect(args[0]).to eq('message.txt')
    end

    it 'returns the file to write to' do
      expect(args[1]).to eq('encrypted.txt')
    end

    it 'contains the text from the open file' do
      expect(@interface.message).to eq(message)
    end
  end

  describe '#start_enigma' do #passes the needed information to enigma and
    it 'returns the appropriate hash' do
      # There will likely be an if/else statment in this method based on how
      # many arguments come from ARGV
      expect(@enigma.encrypt(args[0], args[1], args[2], args[3]))
    end
  end




end
