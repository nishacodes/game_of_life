
class Cell
  attr_accessor :state, :x, :y, :neighbors, :world

  ALL = [] # only used when assigning each cell to the same instance of Board

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

  def evaluate_neighbors
    get_neighbors
    
    neighbor_states = @neighbors.collect do |object|
      object.state
    end  

    case state
      when alive
        # 2 or 3 live neighbors
        if neighbor_states.count(alive) == 2 || neighbor_states.count("o") == 3
          world.to_live << self 
        else
          # any other amount will be less than 2 or more than 3
          world.to_die << self 
        end      
      when dead
        if neighbor_states.count(alive) == 3 
          world.to_live << self 
        else
          world.to_die << self
        end
    end  

    # world.to_die << self if neighbor_states.count("o") < 2
    # if neighbor_states.count("o") == 2 || neighbor_states.count("o") == 3
    #   world.to_live << self 
    # end  
  end
    
end