gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sequence_matcher'

class SequenceMatcherTest < Minitest::Test

  def test_it_has_a_secret_sequence
    matcher = SequenceMatcher.new("rgby", "guess")
    assert_equal "rgby", matcher.secret
  end

  def test_another_secret_sequence
    matcher = SequenceMatcher.new("absf", "guess")
    assert_equal "absf", matcher.secret
  end

  def test_it_has_guess_sequence
    matcher = SequenceMatcher.new("bbby", "bbby")
    assert_equal "bbby", matcher.guess
  end

  def test_another_guess_sequence
    matcher = SequenceMatcher.new("gggr", "gggr")
    assert_equal "gggr", matcher.guess
  end

  def test_it_can_match_sequences
    matcher = SequenceMatcher.new("gggr", "gggr")
    assert matcher.match?

    matcher = SequenceMatcher.new("gggr", "bbyr")
    refute matcher.match?
  end

  def test_it_returns_one_matching_letter_count
    matcher = SequenceMatcher.new("gggr", "yyry")
    assert_equal 1, matcher.match_count
  end

  def test_it_returns_two_matching_letters_count
    matcher = SequenceMatcher.new("gggr", "ygry")
    assert_equal 2, matcher.match_count
  end

  def test_it_returns_three_matching_letters_count
    matcher = SequenceMatcher.new("gryb", "gryy")
    assert_equal 3, matcher.match_count
  end

  def test_it_returns_four_matching_letters_count
    matcher = SequenceMatcher.new("gryb", "byrg")
    assert_equal 4, matcher.match_count
  end

  def test_it_count_one_matching_position
    matcher = SequenceMatcher.new("gbry", "gryb")
    assert_equal 1, matcher.position_count
  end

  def test_it_count_two_matching_positions
    matcher = SequenceMatcher.new("gbry", "gbyr")
    assert_equal 2, matcher.position_count
  end

  def test_it_counts_three_matching_positions
    matcher = SequenceMatcher.new("gbry", "gbrr")
    assert_equal 3, matcher.position_count
  end

  def test_it_provides_match_feedback_on_a_guess
    matcher = SequenceMatcher.new("gbry", "gbbr")
    expected = {
      :correct_letters => 3,
      :correct_position => 2,
      :full_match => false
    }
    assert_equal expected, matcher.match_data
  end

  def test_it_provides_match_data_on_a_correct_guess
    matcher = SequenceMatcher.new("gbry", "gbry")
    expected = {
      :correct_letters => 4,
      :correct_position => 4,
      :full_match => true
    }
    assert_equal expected, matcher.match_data
  end


end
