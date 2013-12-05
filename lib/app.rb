require "./board"
require "./cell"

# specify width and height
board = Board.new(100,30)

# assigns board to be the world for each cell
Cell::ALL.each do |object|
  object.world = board
end

# create initial pattern, specify starting point for each
board.create_blinker(5,20)
board.create_toad(10,40)
board.display

# run the generations and watch the cells change (specify number of generations)
board.generation(50)
