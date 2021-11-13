require './lib/enigma'
require './lib/interface'

describe Interface do
  before(:each) do
    @file = File.open('message.txt')
    @test = @file.read
    @args = ARGV
  end

end
