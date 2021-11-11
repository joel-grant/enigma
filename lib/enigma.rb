require 'date'

class Enigma
  attr_accessor :file, :text, :key, :date, :write

  def initialize
    @file   = File.open('message.txt', 'r')
    @text   = @file.read
    @key    = ARGV[2]
    @date   = ARGV[3]
    @write  = ARGV[1]
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

  def encrypt(message, key, date)


    # returns a hash of the encrypted text, the key and the date used.
  end



  def decrypt(message, key, date)
  end

end
