gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_builder'

class GuessBuilderTest < Minitest::Test
  def test_it_exists
    assert GuessBuilder.new
  end

  def test_it_is_happy_with_a_correct_length_guess
    gb = GuessBuilder.new
    result = gb.build('ffff')
    assert result.valid?
  end

  def test_a_too_short_guess_is_invalid
    gb = GuessBuilder.new
    guess = gb.build('aaa')
    refute guess.valid?
  end

  def test_a_too_long_guess_is_invalid
    gb = GuessBuilder.new
    guess = gb.build('bbbbb')
    refute guess.valid?
  end


end
