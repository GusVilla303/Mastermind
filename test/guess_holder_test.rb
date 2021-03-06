gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_holder'

class GuessHolderTest < Minitest::Test

  def test_it_starts_with_an_empty_array
    holder = GuessHolder.new
    assert_equal 0, holder.guess_counter
  end

  def test_it_can_add_a_guess
    holder = GuessHolder.new
    holder.add_guess('rgby')
    assert_equal 1, holder.guess_counter
  end

  def test_it_can_add_two_guesses
    holder = GuessHolder.new
    holder.add_guess('rgby')
    holder.add_guess('bbby')
    assert_equal 2, holder.guess_counter
  end

  def test_it_can_add_4_guesses
    holder = GuessHolder.new
    holder.add_guess('rgby')
    holder.add_guess('bygr')
    holder.add_guess('rrgy')
    holder.add_guess('yybr')
    assert_equal 4, holder.guess_counter
  end
end
