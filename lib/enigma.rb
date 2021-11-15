require './lib/generate'
require './lib/shift'
class Enigma
  include Generate
  attr_accessor :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @shift = Shift.new
  end

  def encrypt(message, key = new_key, date = current_date)
    incoming_message = message.downcase.split("")
    shifts = @shift.create_shifts(key, date)
    encrypted_message = ""
    incoming_message.each do |char|
      if @alphabet.include?(char)
        index = @alphabet.index(char)
        encrypted_message += @alphabet.rotate(shifts[0] + index)[0]
      else
        encrypted_message += char
      end
      shifts.rotate!(1)
    end
    { :date => date, :encryption => encrypted_message, :key => key }
  end

  def decrypt(message, key, date = current_date)
    incoming_message = message.downcase.split("")
    shifts = @shift.create_shifts(key, date)
    decrypted_message = ""
    incoming_message.each do |char|
      if @alphabet.include?(char)
        index = @alphabet.index(char)
        decrypted_message += @alphabet.rotate(@alphabet.size - shifts[0] + index)[0]
      else
        decrypted_message += char
      end
      shifts.rotate!(1)
    end
    { :date => date, :encryption => decrypted_message, :key => key }
  end
end
