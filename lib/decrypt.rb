require './lib/enigma'
require './lib/interface'

file = File.open(ARGV[0], 'r')
message = file.read

interface = Interface.new(message, ARGV)
decryption = interface.start_enigma_decryption
interface.display_decryption(decryption)

new_file = File.open(ARGV[1], 'w')
new_file.write(decryption[:encryption])
new_file.close
