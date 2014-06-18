gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test
  def test_it_exists
    assert SequenceGenerator.new(4, ['r','g', 'b', 'y'])
  end

  def test_it_generates_a_new_sequence
    sequence = SequenceGenerator.new(4, ['r','g', 'b', 'y'])
    sequence.generate
    assert sequence.generate
  end
end
