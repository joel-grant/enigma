require './lib/shift'
require 'spec_helper'
require 'date'
require './lib/shift'

describe Shift do
  let(:encrypt_return) { { encryption: "keder ohulw", key: "02715", date: "040895" } }
  before(:each) do
    @shift.make_the_shifts("02715", "040895")
    @shift_1 = Shift.new
  end

  describe '#initialize' do
    it 'returns an instance of Shift' do
      expect(@shift).to be_a Shift
    end

    it 'returns the key' do
      expect(@shift.key_offsets).to eq("02715")
    end

    it 'returns the date' do
      expect(@shift.date_offsets).to eq("040895")
    end
  end

  describe '#create_shifts' do
    it 'returns an array' do
      key = "02715"
      date = "040895"
      expect(@shift.create_shifts(key, date)).to be_a Array
    end

    it 'must only return elements of type Integer' do
      key = "02715"
      date = "040895"
      expect(@shift.create_shifts(key, date)[0]).to be_a Integer
    end

    it 'creates and returns an array of the final shifts for the encrypter' do
      key = "02715"
      date = "040895"
      expect(@shift.create_shifts(key, date)).to eq([3, 27, 73, 20])
    end
  end

  describe '#create_offset' do
    it 'creates an array of each offset digit' do
      expect(@shift.create_offset(encrypt_return[:date])).to eq("1025")
    end
  end

  describe '#key_shift' do
    it 'returns an array of the 4 key shifts' do
      expect(@shift.key_shift(encrypt_return[:key])).to eq(["02", "27", "71", "15"])
    end
  end

  describe '#offset_shift' do
    it 'returns an array of the 4 offset shifts' do
      expect(@shift.offset_shift(encrypt_return[:date])).to eq(["1", "0", "2", "5"])
    end
  end

end
