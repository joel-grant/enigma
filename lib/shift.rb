class Shift
  attr_accessor :key_offsets, :date_offsets

  def initialize
    # @key_offsets   = []
    # @date_offsets  = []
  end
  #
  # def self.make_the_shifts(key, date)
  #   shift = Shift.new
  #   key_shift(key)
  #   offset_shift(date)
  #   require 'pry'; binding.pry
  #   create_shifts
  # end

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
      # require 'pry'; binding.pry
      final_shifts << offsets[index].to_i + number.to_i
    end
    final_shifts
  end
end
