class Sequence
  attr_reader :letters

  def initialize(code)
    @letters = code
  end

  def to_s
    @letters.join.upcase
  end
end
