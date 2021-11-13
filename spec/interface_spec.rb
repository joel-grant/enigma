require './lib/enigma'
# require './lib/interface'

describe Interface do
  before(:each) do
    @file = File.open('message.txt', 'r')
    @test = @file.read
    @args = ARGV
    @interface = Interface.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  end
  describe '' do
    it 'contains and returns the file name to read' do

    end
  end

end
