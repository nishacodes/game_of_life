
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

  def left_edge?
    x == 0
  end

  def top_edge?
    y == 0
  end

  def right_edge?
    @x == (world.width - 1)
  end

  def bottom_edge?
    @y == (world.height - 1)
  end

  def get_neighbors
    @neighbors << world.grid[y][x-1] unless left_edge? # west
    @neighbors << world.grid[y][x+1] unless right_edge? # east
    @neighbors << world.grid[y-1][x-1] unless (top_edge? || left_edge?) # northwest
    @neighbors << world.grid[y-1][x] unless top_edge? # north
    @neighbors << world.grid[y-1][x+1] unless (top_edge? || right_edge?) # northeast
    @neighbors << world.grid[y+1][x-1] unless (bottom_edge? || left_edge?) # southwest
    @neighbors << world.grid[y+1][x] unless bottom_edge? # south
    @neighbors << world.grid[y+1][x+1] unless (bottom_edge? || right_edge?) # southeast
    @neighbors
  end
    
  
  # def self.all
  #   @@all
  # end

  # def self.count
  #   @@all.count
  # end
end