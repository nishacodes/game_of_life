require "../lib/board"
require "../lib/cell"

describe Board, "#display" do
  it "should create a board with 'height' arrays and 'width' elements" do 
    board = Board.new(10,20)
    expect(board.grid.count).to eq(20) # counts number of arrays (height)
    expect(board.grid[0].count).to eq(10) # counts items in first array (width)   
  end
  
end

