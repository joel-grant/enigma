class Interface
  attr_reader :enigma, :in_file_name, :out_file_name, :key, :date, :message

  def initialize(message, details)
    @enigma = Egnima.new
    @in_file_name   = details[0]
    @out_file_name  = details[1]
    @key            = details[2]
    @date           = details[3]
    @message        = message
  end

   
end
