require 'test/unit'
require 'macaw'

class TALTest < Test::Unit::TestCase
  def test_basics
    puts File.open(File.dirname(__FILE__) + '/__TEXT__').read
  end
end
