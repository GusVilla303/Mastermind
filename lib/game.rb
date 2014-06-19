class Game

#attr_reader :started_at

  def initialize
    @count = 0
    @won = false
    #Generate the secret sequence
  end

  def count
    @count
  end

  def turn
    @count += 1
  end

  def won?
    if match? == true
    end
  end

end
