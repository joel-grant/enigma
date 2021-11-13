require './lib/enigma'
require './lib/interface'

file = File.open('message.txt', 'r')
message = file.read

go_go_gadget_interface = Interface.new(message, ARGV)
go_go_gadget_interface.start_enigma
