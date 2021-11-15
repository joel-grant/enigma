require 'spec_helper'
require 'date'
require './lib/enigma'

describe Enigma do
  let(:enigma) { Enigma.new }
  let(:encrypt_return) { { encryption: "keder ohulw", key: "02715", date: "040895" } }
  before(:each) do
    @today = Date.today
    @shift = Shift.new
  end

  describe '#initialize' do
    it 'returns an instance of Enigma' do
      expect(enigma).to be_a Enigma
    end

    it 'can return the list of approved characters' do
      expect(enigma.alphabet).to eq(("a".."z").to_a << " ")
    end

    it 'can return the current encryption hash' do
      expect(enigma.encryption).to be_a Hash
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

  describe '#cipher_encrypt' do
    it 'creates the hash that is stored in the instance variable @encryption' do
      enigma.cipher_encrypt([3, 27, 73, 20], ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
      expect(enigma.encryption[:encryption]).to eq("keder ohulw")
    end
  end

  describe '#cipher_decrypt' do
    it 'creates the hash that is stored in the instance variable @encryption' do
      enigma.cipher_decrypt([3, 27, 73, 20], ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"])
      expect(enigma.encryption[:encryption]).to eq("hello world")
    end
  end

  describe '#encrypt' do
    it 'returns a hash containing the encrypted text, the key and the date' do
      shifts = @shift.create_shifts(encrypt_return[:key], encrypt_return[:date])
      message = "hello world".downcase.split("")
      text = "hello world"
      key = "02715"
      date = "040895"
      enigma.cipher_encrypt(shifts, message)
      expect(enigma.encrypt(text, key, date)).to eq(enigma.encryption)
    end
    it 'correctly ignores special symbols beyond the alphabet and white space' do
      expect(enigma.encrypt("mr.")[:encryption][2]).to eq(".")
    end

  end

  describe '#decrypt' do
    it 'returns a hash containing the decrypted text, the key and the date used' do
      shifts = @shift.create_shifts(encrypt_return[:key], encrypt_return[:date])
      message = "hello world".downcase.split("")
      enigma.cipher_decrypt(shifts, message)
      text = "keder ohulw"
      key = "02715"
      date = "040895"
      expect(enigma.decrypt(text, key, date)).to eq(enigma.encryption)
    end
    it 'correctly ignores special symbols beyond the alphabet and white space' do
      expect(enigma.decrypt("mr.", "02715")[:encryption][2]).to eq(".")
    end
  end
end
