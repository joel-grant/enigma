require './lib/enigma'

class Interface
  attr_reader :enigma, :in_file, :out_file, :message

  def initialize(message, details)
    @enigma   = Enigma.new
    @in_file  = details[0]
    @out_file = details[1]
    @message  = message
  end

  def start_enigma
    encrypted_hash = @enigma.encrypt(@message)
    display_count(encrypted_hash)
  end

  def display_output(result)
    display =  "Created \'#{@out_file}\' with key #{result[:key]} and date #{result[:date]}"
    p display
  end
end
