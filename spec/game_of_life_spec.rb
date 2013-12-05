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

  # ASSIGN COORDINATES
  it "should assign x and y coordinates to each object, based on its position" do
    board = Board.new(10,10)
    board.assign_coordinates
    expect(board.grid[3][5].y).to eq(3) 
  end
end


describe Cell, "#allmethods" do
  
  # INITIALIZE
  it "should create a dead cell" do 
    expect(Cell.new.state).to eq(".") 
  end

  it "should have all cells belong to the same world" do
    board = Board.new(10,10)
    board.grid[5][5]
    expect(board.grid[5][5].world = board.grid[6][6] = board).to be_true
  end

  # GET NEIGHBORS
  # it "cells have 8 neighbors unless they lie on the edge" do
  #   board = Board.new(10,10)
  #   Cell::ALL.each do |object|
  #     object.world = board
  #   end
  #   expect(board.grid[9][9].get_neighbors.count).to eq(8)
  # end

  it "a cell at [9,9] will have the following neighbors" do
    board = Board.new(10,10)
    board.grid[9][9].world = board
    expect(board.grid[9][9].get_neighbors.collect {|object| [object.y, object.x]}).to eq([[9,8],[8,8],[8,9]])
  end
  
end
