require 'spec_helper'
require 'date'
require './lib/enigma'

describe Enigma do
  let(:enigma) { Enigma.new }
  let(:encrypt_return) { { encryption: "keder ohulw", key: "02715", date: "040895" } }
  before(:each) do

    @today = Date.today
  end

  describe '#initialize' do
    it 'returns an instance of Enigma' do
      expect(enigma).to be_a Enigma
    end

    it 'can return and contain the open .txt file' do

    end
  end

  describe '#create_shifts' do
    it 'returns an array' do
      key = "02715"
      date = "040895"
      expect(enigma.create_shifts(key, date)).to be_a Array
    end

    it 'must only return elements of type Integer' do
      key = "02715"
      date = "040895"
      expect(enigma.create_shifts(key, date)[0]).to be_a Integer
    end

    it 'creates and returns an array of the final shifts for the encrypter' do
      key = "02715"
      date = "040895"
      expect(enigma.create_shifts(key, date)).to eq([3, 27, 73, 20])
    end
  end

  describe '#create_offset' do
    it 'creates an array of each offset digit' do
      expect(enigma.create_offset(encrypt_return[:date])).to eq("1025")
    end
  end

  describe '#key_shift' do
    it 'returns an array of the 4 key shifts' do
      expect(enigma.key_shift(encrypt_return[:key])).to eq(["02", "27", "71", "15"])
    end
  end

  describe '#offset_shift' do
    it 'returns an array of the 4 offset shifts' do
      expect(enigma.offset_shift(encrypt_return[:date])).to eq(["1", "0", "2", "5"])
    end
  end

  describe '#new_key' do
    it 'returns the number as a string' do
      expect(enigma.new_key).to be_a String
    end
    it 'returns a randomly generated 5-digit key' do
      expect(enigma.new_key.length).to eq(5)
    end
  end

  describe '#current_date' do
    it 'returns a string' do
      expect(enigma.current_date).to be_a String
    end

    it 'returns the current date as MMDDYY' do
      expect(enigma.current_date).to eq(@today.strftime("%m%d%y"))
    end

  end

  describe '#encrypt' do
    it 'returns a hash containing the encrypted text, the key and the date' do
      # allow(enigma).to receive(:encrypt).and_return({encryption: "hello world", key: "02715", date: "040895"})
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(encrypt_return)
    end

  end

  describe '#decrypt' do
    it 'returns a hash containing the decrypted text, the key and the date used' do
      text = "keder ohulw"
      key = "02715"
      date = "040895"
      expect(enigma.decrypt(text, key, date)).to eq({encryption: "hello world", key: "02715", date: "040895"})
    end
  end
end
