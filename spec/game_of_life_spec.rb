require "../lib/board"
require "../lib/cell"

describe "Board" do
  
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

  # ASSIGN COORDINATES
  it "should assign x and y coordinates to each object, based on its position" do
    board = Board.new(10,10)
    expect(board.grid[3][5].y).to eq(3) 
  end

  # CREATE INITIAL PATTERNS
  it "should create 3 live cells in a row for blinker" do
    board = Board.new(10,10)
    board.create_blinker(4,4)
    expect(board.grid[4][4].state).to eq("o") 
    expect(board.grid[4][3].state).to eq("o") 
    expect(board.grid[4][5].state).to eq("o") 
  end

  it "should create 3 live cells in a row for toad" do
    board = Board.new(10,10)
    board.create_toad(6,5)
    expect(board.grid[6][5].state).to eq("o") 
    expect(board.grid[6][6].state).to eq("o") 
    expect(board.grid[6][7].state).to eq("o") 
    expect(board.grid[5][6].state).to eq("o") 
    expect(board.grid[5][7].state).to eq("o") 
    expect(board.grid[5][8].state).to eq("o") 
  end
end


describe "Cell" do
  
  # INITIALIZE
  it "should create a dead cell" do 
    expect(Cell.new.state).to eq(".") 
  end

  it "should have all cells belong to the same world" do
    board = Board.new(10,10)
    board.grid[5][5]
    expect(board.grid[5][5].world = board.grid[6][6] = board).to be_true
  end
  
  # EDGE METHODS
  it "cell [0,0] should return true for left_edge and top_edge" do
    board = Board.new(10,10)
    Cell::ALL.each do |object|
      object.world = board
    end
    expect(board.grid[0][0].left_edge? && board.grid[0][0].top_edge?).to eq(true)
  end

  it "cell [9,9] should return true for right_edge and bottom_edge" do
    board = Board.new(10,10)
    Cell::ALL.each do |object|
      object.world = board
    end
    expect(board.grid[9][9].right_edge? && board.grid[9][9].bottom_edge?).to eq(true)
  end


  # GET NEIGHBORS
  it "cells have 8 neighbors unless they lie on the edge" do
    board = Board.new(10,10)
    Cell::ALL.each do |object|
      object.world = board
    end
    expect(board.grid[5][5].get_neighbors.count).to eq(8)
  end

  it "a cell at [9,9] will have the following neighbors" do
    board = Board.new(10,10)
    board.grid[9][9].world = board
    expect(board.grid[9][9].get_neighbors.collect {|object| [object.y, object.x]}).to eq([[9,8],[8,8],[8,9]])
  end

  # COUNT_LIVE_NEIGHBORS
  it "a cell should have 0 live neighbors when board is new" do
    board = Board.new(10,10)
    Cell::ALL.each do |object|
      object.world = board
    end
    expect(board.grid[5][5].get_neighbors.collect {|object| object.state}).should_not include("o")
  end

  # COUNT_DEAD_NEIGHBORS
  it "a cell at [9,9] will have the following neighbors" do
   
  end
  
end
