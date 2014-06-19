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
    @guess_holder.count
  end
end

 #I need a guess holder array
 #I need to put the guesses into
 #this array
 #I need to check that the guesses are
 #in the array
