require_relative 'sequence'

class SequenceGenerator
  attr_reader :length, :pool

  def initialize(length, pool)
    @length = length
    @pool   = pool
  end

  def generate
    code = (0...length).collect{ pool.sample }
    Sequence.new(code)
  end
end
