class Cell
  attr_accessor :state, :x, :y, :neighbors, :world

  ALL = []

  def initialize
    @state = dead
    @x
    @y
    @neighbors = []
    @world
    ALL << self
  end

  def dead
    return "."
  end

  def alive
    return "o"
  end

  # def board=(board)
  #   @board = board
  # end

  def show_coordinates
    # puts [@y,@x]
  end

  def get_neighbors
    @neighbors << world.grid[y][x-1] # west 
    @neighbors << world.grid[y][x+1] # east
    @neighbors << world.grid[y-1][x-1] # northwest
    @neighbors << world.grid[y-1][x] # north
    @neighbors << world.grid[y-1][x+1] # northeast
    @neighbors << world.grid[y+1][x-1] # southwest
    @neighbors << world.grid[y+1][x] # south
    @neighbors << world.grid[y+1][x+1] # southeast
  end

  
  # def self.all
  #   @@all
  # end

  # def self.count
  #   @@all.count
  # end
end