# class GuessBuilder
#   def build(input)
#     Guess.new(input)
#   end
# end

class Guess
  attr_reader :letters

  def initialize(input)
    @letters = input.chars
  end

  def valid?
    @letters.length == 4
  end
end
