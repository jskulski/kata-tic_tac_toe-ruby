require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	it "game can be created" do
		TicTacToe.new
	end

	it "a move can be made" do
		game = TicTacToe.new
		game.move
	end

	it "can determine if there is a winner" do
		game = TicTacToe.new
		game.winner?
	end



end


