# require "./pattern"

class Board
  attr_accessor :grid, :width, :height, :to_die, :to_live
  include Pattern

	def initialize(width, height, generations, pattern="random")
    @width = width
    @height = height
    @grid = []
    @to_die = []
    @to_live = []
    @pattern = pattern
    create_empty_board
    assign_coordinates
    @pattern == "pattern" ? add_set_pattern : add_random_pattern
    display
    generation(generations)
	end

  def create_empty_board
    height.times do |i|  # creates an array for each row
      grid << Array.new
    end
    grid.each do |array|
      width.times do |i|
        array[i] = Cell.new.tap {|object| object.board = self}
      end
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

  def add_set_pattern
    create_toad(3,49)
    create_toad(26,49)
    create_toad(15,30)
    create_toad(15,70)
    create_blinker(5,30)
    create_blinker(5,70)
    create_blinker(25,30)
    create_blinker(25,70)
    create_pulsar(7,15)
    create_pulsar(7,85)
    create_pulsar(15,50)
    create_pulsar(22,15)
    create_pulsar(22,85)
  end

  def add_random_pattern
    random(1000)
  end

  def generation(number)
    number.times do |i|
      evaluate_cells
      tick!
      clear_stage
      display
      sleep(0.5)
    end
  end

  def display
    grid.each do |row|
      row.each {|cell| print "#{cell.state}"}
      puts
    end
  end


  def iterate
    grid.each do |array|
      array.each do |object|
        yield object
      end
    end
  end

  def evaluate_cells
    iterate {|object| object.evaluate_neighbors}
  end

  def tick!
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



end


