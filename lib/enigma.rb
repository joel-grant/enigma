require './lib/generate'

class Enigma
  include Generate
  attr_accessor :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def key_shift(key)
    keys = []
    4.times do |num|
      keys << key[num..num+1]
    end
    keys
  end

  def create_offset(date)
    squared_date = (date.to_i * date.to_i)
    offset_string = squared_date.to_s[-4..-1]
  end

  def offset_shift(date)
    offset = create_offset(date)
    offsets = []
    4.times do |num|
      offsets << offset[num]
    end
    offsets
  end

  def create_shifts(key, date)
    keys = key_shift(key)
    offsets = offset_shift(date)
    final_shifts = []
    keys.each.with_index(0) do |number, index|
      final_shifts << offsets[index].to_i + number.to_i
    end
    final_shifts
  end

  def encrypt(message, key = new_key, date = current_date)
    incoming_message = message.downcase.split("")
    shifts = create_shifts(key, date)
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
    shifts = create_shifts(key, date)
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
