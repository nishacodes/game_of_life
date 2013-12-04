class Cell
  attr_accessor :state

  def initialize
    @state = dead
  end

  def dead
    return "."
  end

  def alive
    return "o"
  end

end