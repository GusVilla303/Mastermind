require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test
  def test_turn_count_starts_at_zero_turns
    game = Game.new
    assert_equal 0, game.count
  end

  def test_counting_number_of_turns
    game = Game.new
    game.turn
    assert_equal 1, game.count
    3.times { game.turn }
    assert_equal 4, game.count
  end

  def test_keep_timer
    skip
  end

end
  #Jeff's code from our meeting. Variable names differ!!

  # def test_player_can_win_a_game_on_the_first_guess
  #   game = Game.new
  #   secret = game.sequence
  #   game.guess(secret)
  #   assert game.won?


  # def test_player_can_win_a_game_on_the second_guess
