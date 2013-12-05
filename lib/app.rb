require "./board"
require "./cell"

board = Board.new(4,4)
# board.display
# board.assign_coordinates

# # # assigns board to be the world for each cell
Cell::ALL.each do |object|
  object.world = board
end


# Cell.all.each do |element|
#   element.show_coordinates
# end

