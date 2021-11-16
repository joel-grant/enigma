require './lib/enigma'
require './lib/interface'

file = File.open(ARGV[0], 'r')
message = file.read

interface = Interface.new(message, ARGV)
encryption = interface.start_enigma_encryption

new_file = File.open(ARGV[1], 'w')
new_file.write(encryption[:encryption])
new_file.close

p "Created \'#{ARGV[1]}\' with the key #{encryption[:key]} and date #{encryption[:date]}"
