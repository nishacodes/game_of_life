class Board
  attr_accessor :grid, :width, :height

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

  def create_blinker(y,x) # starting point
    grid[y][x].state = "o"
    grid[y][x-1].state = "o"
    grid[y][x+1].state = "o"
  end

   def create_toad(y,x) # starting point
    grid[y][x].state = "o"
    grid[y][x-1].state = "o"
    grid[y][x+1].state = "o"
  end
end


