class Shift
  attr_reader :key, :date

  def initialize
    @key = ""
    @date = ""
  end

  def create_shifts(key, date)
    @key = key
    @date = date
    keys = key_shift
    offsets = offset_shift
    final_shifts = []
    keys.each.with_index(0) do |number, index|
      final_shifts << offsets[index].to_i + number.to_i
    end
    final_shifts
  end

  def key_shift
    keys = []
    4.times do |num|
      keys << @key[num..num+1]
    end
    keys
  end

  def create_offset
    squared_date = (@date.to_i * @date.to_i)
    offset_string = squared_date.to_s[-4..-1]
  end

  def offset_shift
    offset = create_offset
    offsets = []
    4.times do |num|
      offsets << offset[num]
    end
    offsets
  end
end
