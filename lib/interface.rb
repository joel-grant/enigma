require './lib/enigma'

class Interface
  attr_reader :enigma, :in_file, :out_file, :message

  def initialize(message, details)
    @enigma   = Enigma.new
    @in_file  = details[0]
    @out_file = details[1]
    @key      = details[2]
    @date     = details[3]
    @message  = message
  end

  def start_enigma_encryption
    encrypted_hash = @enigma.encrypt(@message)
    display_encryption(encrypted_hash)
    write_to_file(encrypted_hash)
  end

  def start_enigma_decryption
    decrypted_hash = @enigma.decrypt(@message, @key, @date)
    display_decryption(decrypted_hash)
    write_to_file(decrypted_hash)
  end

  def display_encryption(result)
    display =  "Created \'#{@out_file}\' with the key #{result[:key]} and date #{result[:date]}"
    p display
  end

  def display_decryption(result)
    display = "Created \'#{@out_file}\' with the key #{result[:key]} and date #{result[:date]}"
    p display
  end

  def write_to_file(result)
    new_file = File.open(@out_file, 'w')
    new_file.write(result[:encryption])
    new_file.close
  end
end
