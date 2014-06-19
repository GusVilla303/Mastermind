class Game
  def initialize
    @count = 0
    @won = false
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
