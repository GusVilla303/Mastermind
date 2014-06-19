class GuessHolder

  attr_reader     :guess_holder
  attr_accessor   :guess_counter

  def initialize
    @guess_holder = []
  end

  def add_guess(guess)
    @guess_holder << guess
  end

  def guess_counter
    @guess_holder.size
  end
end
