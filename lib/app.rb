require "./board"
require "./cell"

board = Board.new(100,30)

# assigns board to be the world for each cell
Cell::ALL.each do |object|
  object.world = board
end


board.create_blinker(5,20)
# board.create_toad(10,40)
board.display
board.evaluate_cells
board.to_live.each do |object| 
  puts "#{object.y}, #{object.x}"
  
end
#   object.neighbors.each do |neighbor|
#     puts neighbor.state
#   end
# end


# shovel the object into world.to_die
# from board, call the inspect method and return the to_die array