require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	it "game can be created" do
		TicTacToe.new
	end

	it "game can make move" do
		game = TicTacToe.new
		game.move
	end


end


