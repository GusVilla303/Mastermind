class CLI
  def self.run
    CLI.new.start
  end

  attr_reader   :command, :code, :secret, :guess
  attr_accessor :guess_counter

  def initialize
    @command = ''
    @code    = ''
    @secret  = SequenceGenerator.new(4, %w[r g b y]).generate
  end

  def start
    puts "\n"
    puts "Welcome to MASTERMIND."
    puts "Would you like to (p)lay, see (i)nstructions or (q)uit?"
    puts "Input your answer and hit Enter. "
    command = gets.chomp.downcase
    case command
    when 'p'
      guess_input
    when 'i'
      instructions
    when 'q'
      puts "Goodbye!"
    end
  end

  def instructions
    puts "\n    The objective of Mastermind is to try to guess a 'secret sequence,'
    which is made up of: (r)ed,(g)reen, (b)lue, and (y)ellow. Input your guess
    in the command line to see if your guess matches.  Good luck!!!
    Use (q)uit at any time to end the game."
    puts "\n"
    puts "Would you like to (p)lay or (q)uit?"
    command = gets.chomp.downcase
    case command
    when 'p'
      guess_input
    when 'q'
      puts "Goodbye!"
    end
  end

  def guess_input
    puts "\n I have generated a beginner sequence with four elements made up of:(r)ed, (g)reen,
    (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess? "
    input = ''
    until input == 'q'
      input   = gets.chomp.downcase
      @guess  = Guess.new(input)
      matcher = SequenceMatcher.new(secret, guess)
      if guess.valid?
        execute_game(matcher)
      else
        puts "Your guess is NOT valid, make sure you input FOUR letters."
      end
    end
    puts "Goodbye!"
  end

  def execute_game(matcher)
    print @secret.letters
    puts ''
    if matcher.match?
       win_message
    else
      match_count    = matcher.match_count
      match_position = matcher.position_count
      puts "'#{guess}' has #{match_count} of the correct elements with #{match_position} in the correct positions."
      puts "You've taken #{guess_counter} guess."
      puts "Enter another guess: "
    end
  end

  def win_message
    puts "Congratulations...you guessed the sequence '#{secret.to_s}'!"
    puts "Would you like to (p)lay again or (q)uit?"
    command = gets.chomp.downcase
    case command
    when 'p'
    guess_input
    when 'q'
    puts "Goodbye!"
    end
  end
end
