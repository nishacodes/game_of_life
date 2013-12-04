class Board
  attr_accessor :grid

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
	end

  def display
    grid.each do |row|
      row.each {|cell| print "#{cell}"}
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

  def get_neighbors
     grid.each_with_index do |array, y_index|
      array.each_with_index do |element, x_index|
        element.tap do |cell|
          cell.neighbors << grid[0][0]
        end
      end
    end
  end
end


