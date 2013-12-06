require "./board"
require "./cell"

# specify width and height
board = Board.new(100,30)

# assigns board to be the world for each cell
Cell::ALL.each do |object|
  object.board = board
end

# create initial patterns, specify starting point for each
board.create_blinker(5,20)
board.create_toad(10,40)
board.display

# run the generations and watch the cells change (specify number of generations)
board.generation(50)



# QUESTIONS
# - how to structure app.com? put it in a class? should fewer methods be called?
# - @world = board. confu
# - for the following block, is this the best place to put it? wont work in Cell or Board
  # Cell::ALL.each do |object|
  #  object.world = board
  # end
  
# - how to remove repetition of nested each statements in Board class. can you use yield?
# - calling methods from other methods or from app? (ex generation or evaluate_neighbors)
# 

