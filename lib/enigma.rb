require 'date'

class Enigma
  attr_accessor :file, :text, :key, :date, :write, :alphabet

  def initialize
    @file   = File.open('message.txt', 'r')
    @text   = @file.read
    @key    = ARGV[2]
    @date   = ARGV[3]
    @write  = ARGV[1]
    @alphabet = ("a".."z").to_a << " "
  end

  # def self.from_file(text, key, date)
  #   enigma = Enigma.new
  # end
  def new_key
    rand(00000..99999).to_s.rjust(5, "0")
  end

  def current_date
    today = Date.today
    today.strftime("%m%d%y")
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

  def create_shifts(keys, offsets)
    final_shifts = []
    keys.each.with_index(0) do |number, index|
      final_shifts << offsets[index].to_i + number.to_i
    end
    final_shifts
  end

  def encrypt(message, key = new_key, date = current_date)
    incoming_message = message.split("")
    offset_shift = (date.to_i * date.to_i).to_s[-4..-1]
    keys = key_shift(key)
    offsets = offset_shift(date)
    shifts = create_shifts(keys, offsets)
    encrypted_message = ""
    incoming_message.each.with_index do |char|
      index = @alphabet.index(char)
      encrypted_message += @alphabet.rotate(shifts[0] + index)[0]
      shifts.rotate!(1)
    end
    { :date => date, :encryption => encrypted_message, :key => key }
  end

  def decrypt(message, key, date = current_date)
    incoming_message = message.split("")
    test_array = []
    offset_shift = (date.to_i * date.to_i).to_s[-4..-1]
    # key_shift(key)
    a_key = key[0..1].to_i
    b_key = key[1..2].to_i
    c_key = key[2..3].to_i
    d_key = key[3..4].to_i

    a_offset = offset_shift[0].to_i
    b_offset = offset_shift[1].to_i
    c_offset = offset_shift[2].to_i
    d_offset = offset_shift[3].to_i

    a_shift = a_key + a_offset
    b_shift = b_key + b_offset
    c_shift = c_key + c_offset
    d_shift = d_key + d_offset
    shift_values = [a_shift, b_shift, c_shift, d_shift]
    shifts = []
    shift_values.each do |value|
      shifts << value
    end

    decrypted_message = ""
    incoming_message.each.with_index do |char|
      char_index = @alphabet.index(char)
      decrypted_message += @alphabet.rotate(@alphabet.size - shifts[0] + char_index)[0]
      shifts.rotate!(1)
    end

    { :date => date, :encryption => decrypted_message, :key => key }

  end

end
