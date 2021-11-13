class Interface
  attr_reader :enigma, :details, :in_file, :out_file, :message

  def initialize(message, details)
    @enigma   = Egnima.new
    @in_file  = details[0]
    @out_file = details[1]
    @message  = message
  end

  def start_enigma
    encrypted_hash = @enigma.encrypt(@message)
    display_output(encrypted_hash)
  end

  def display_output(result)
    puts "Created #{@outfile} with key #{result[:key]} and date #{result[:date]}"
  end


end
