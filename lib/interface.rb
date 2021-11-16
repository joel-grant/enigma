require './lib/enigma'

class Interface
  attr_accessor :enigma, :in_file, :out_file, :message, :key, :date

  def initialize(message, details)
    @enigma   = Enigma.new
    @in_file  = details[0]
    @out_file = details[1]
    @key      = details[2]
    @date     = details[3]
    @message  = message
  end

  def start_enigma_encryption
    @enigma.encrypt(@message)
  end

  def start_enigma_decryption
    @enigma.decrypt(@message, @key, @date)
  end
end
