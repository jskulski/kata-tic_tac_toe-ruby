require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	Given(:game) { TicTacToe.new }

	context "plays complete games" do 
		it "detects a winning top row" do 
			game.make_move('X', 0, 0)
			game.make_move('X', 0, 1)
			game.make_move('X', 0, 2)
			result = game.winner?
			expect(result).to eq('X')
		end
	end

end


