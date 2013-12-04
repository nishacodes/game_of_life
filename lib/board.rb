# require 'awesome_print'

class Board
  attr_accessor :grid

	def initialize(width, height)
    @grid = []
    height.times do |i|  # creates an array for each row
      grid << Array.new
    end
    grid.each do |array|
      width.times do |i|
        array[i] = "."
      end
    end
	end

  def display
    grid.each do |row|
      row.each {|cell| print "#{cell}"}
      puts
    end
  end
end

board = Board.new(100, 30)
board.display

