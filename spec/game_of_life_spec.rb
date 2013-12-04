require "../lib/board"
require "../lib/cell"

describe Board, "#allmethods" do
  
  # INITIALIZE
  it "should create a board with 'height' arrays and 'width' elements" do 
    board = Board.new(10,20)
    expect(board.grid.count).to eq(20) # counts number of arrays (height)
    expect(board.grid[0].count).to eq(10) # counts items in first array (width)   
  end

  it "should be filled with cell objects" do
    board = Board.new(10,20)
    expect(board.grid[0][5].class).to eq(Cell)
  end

end


describe Cell, "#allmethods" do
  
  # INITIALIZE
  it "should create a dead cell" do 
    expect(Cell.new.state).to eq(".") 
  end
  
end
