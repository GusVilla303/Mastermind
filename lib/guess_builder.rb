class GuessBuilder
  def build(input)
    Guess.new(input)
  end
end

class Guess
  attr_reader :code

  def initialize(input)
    @code = input
  end

  def valid?
    @code.length == 4
  end
end
