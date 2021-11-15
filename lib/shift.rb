class Shift
  
  def initialize
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
    @key = key
    @date = date
    keys = key_shift(key)
    offsets = offset_shift(date)
    final_shifts = []
    keys.each.with_index(0) do |number, index|
      final_shifts << offsets[index].to_i + number.to_i
    end
    final_shifts
  end
end
