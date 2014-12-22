require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	Given(:game) { TicTacToe.new }

	context "plays complete games" do 
		it "detects a winning top row" do 
			game.make_move('X', 0, 0)
		end
	end


	context "a move can be made" do
		it "a move can be made" do
			game.make_move('X', 0, 0)
		end
	end

	context "determining a winner" do
		it "can determine if there is a winner" do
			game.winner?
		end
	end

end


