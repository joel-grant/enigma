require './lib/generate'
require './lib/shift'
class Enigma
  include Generate
  attr_reader :alphabet, :encryption, :shift

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @shift = Shift.new
    @encryption = { :date => "", :encryption => "", :key => "" }
  end

  def cipher_encrypt(shifts, incoming_message)
    incoming_message.each do |char|
      if @alphabet.include?(char)
        index = @alphabet.index(char)
        @encryption[:encryption] += @alphabet.rotate(shifts[0] + index)[0]
      else
        @encryption[:encryption] += char
      end
      shifts.rotate!(1)
    end
  end

  def cipher_decrypt(shifts, incoming_message)
    incoming_message.each do |char|
      if @alphabet.include?(char)
        index = @alphabet.index(char)
        @encryption[:encryption] += @alphabet.rotate(@alphabet.size - shifts[0] + index)[0]
      else
        @encryption[:encryption] += char
      end
      shifts.rotate!(1)
    end
  end

  def encrypt(message, key = new_key, date = current_date)
    incoming_message = message.downcase.split("")
    shifts = @shift.create_shifts(key, date)
    @encryption[:key] = key
    @encryption[:date] = date
    cipher_encrypt(shifts, incoming_message)
    @encryption
  end

  def decrypt(message, key, date = current_date)
    incoming_message = message.downcase.split("")
    shifts = @shift.create_shifts(key, date)
    @encryption[:key] = key
    @encryption[:date] = date
    cipher_decrypt(shifts, incoming_message)
    @encryption
  end
end
