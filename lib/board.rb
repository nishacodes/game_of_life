require "./pattern"

class Board
  attr_accessor :grid, :width, :height, :to_die, :to_live
  include Pattern

	def initialize(width, height)
    @width = width
    @height = height
    @grid = []
    height.times do |i|  # creates an array for each row
      grid << Array.new
    end
    grid.each do |array|
      width.times do |i|
        array[i] = Cell.new
      end
    end
    assign_coordinates
    @to_die = []
    @to_live = []
	end

  def display
    grid.each do |row|
      row.each {|cell| print "#{cell.state}"}
      puts
    end
  end

  def assign_coordinates
    grid.each_with_index do |array, y_index|
      array.each_with_index do |element, x_index|
        element.tap do |cell|
          cell.y = y_index
          cell.x = x_index
        end
      end
    end
  end

  # def create_blinker(y,x) # starting point coordinates
  #   blinker = [grid[y][x],grid[y][x-1],grid[y][x+1]]
  #   blinker.each {|object| object.state = object.alive} 
  # end

  # def create_toad(y,x) # starting point coordinates
  #   toad = [grid[y][x],
  #           grid[y][x+1],
  #           grid[y][x+2],
  #           grid[y-1][x+1],
  #           grid[y-1][x+2],
  #           grid[y-1][x+3]]
  #   toad.each {|object| object.state = object.alive}
  # end

  # def create_pulsar(y,x)
  #   pulsar = [grid[y-1][x-2], grid[y-1][x+2],
  #             grid[y-1][x-3], grid[y-1][x+3],
  #             grid[y-1][x-4], grid[y-1][x+4],
  #             grid[y-6][x-2], grid[y-6][x+2],
  #             grid[y-6][x-3], grid[y-6][x+3],
  #             grid[y-6][x-4], grid[y-6][x+4],
  #             grid[y+1][x-2], grid[y+1][x+2],
  #             grid[y+1][x-3], grid[y+1][x+3],
  #             grid[y+1][x-4], grid[y+1][x+4],
  #             grid[y+6][x-2], grid[y+6][x+2], 
  #             grid[y+6][x-3], grid[y+6][x+3],
  #             grid[y+6][x-4], grid[y+6][x+4],
  #             grid[y-2][x-1], grid[y-2][x+1],
  #             grid[y-3][x-1], grid[y-3][x+1],
  #             grid[y-4][x-1], grid[y-4][x+1],
  #             grid[y+2][x-1], grid[y+2][x+1],
  #             grid[y+3][x-1], grid[y+3][x+1],
  #             grid[y+4][x-1], grid[y+4][x+1],
  #             grid[y-2][x-6], grid[y-2][x+6],
  #             grid[y-3][x-6], grid[y-3][x+6],
  #             grid[y-4][x-6], grid[y-4][x+6],
  #             grid[y+2][x-6], grid[y+2][x+6],
  #             grid[y+3][x-6], grid[y+3][x+6],
  #             grid[y+4][x-6], grid[y+4][x+6]
  #           ]
  #   pulsar.each {|object| object.state = object.alive}
  # end

  def evaluate_cells
    grid.each do |array|
      array.each do |object|
        object.evaluate_neighbors
      end
    end
  end

  def tick
    to_die.each do |object|
      object.state = object.dead
    end

    to_live.each do |object|
      object.state = object.alive
    end
  end

  def clear_stage
    to_die.clear
    to_live.clear
  end

  def generation(number)
    number.times do |i|
      evaluate_cells
      tick
      clear_stage
      display
      sleep(0.5)
    end
  end

end


