class SequenceMatcher
  attr_reader :secret, :guess

  def initialize(secret, guess)
    @secret = secret.letters
    @guess  = guess.letters
  end

  def match?
    guess == secret
  end

  def match_count
    count        = 0
    secret_match = @secret.dup

    guess.each do |char|
      if secret_match.include?(char)
        count += 1
        secret_match.delete_at(secret_match.index(char))
      end
    end

    count
  end

  def position_count
    count = 0
    guess.each_with_index do |char, index|
      count += 1 if char == secret[index]
    end
    count
  end

  def match_data
    {
     :correct_letters  => match_count,
     :correct_position => position_count,
     :full_match       => match?
    }
  end
end
