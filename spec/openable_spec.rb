require './lib/enigma'
require './lib/openable'

describe Openable do
  before(:each) do
    @file = File.open('message.txt')
    @test = @file.read
    @args = ARGV
  end
end
