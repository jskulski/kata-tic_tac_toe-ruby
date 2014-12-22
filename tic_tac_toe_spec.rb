require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	Given(:game) { TicTacToe.new }

	context "plays complete games" do 
		it "detects a winning top row for X" do 
			player_token = 'X'
			game.make_move(player_token, 0, 0)
			game.make_move(player_token, 0, 1)
			game.make_move(player_token, 0, 2)
			result = game.winner?
			expect(result).to eq(player_token)
		end

		it "detects a winning top row for Y" do 
			player_token = 'Y'
			game.make_move(player_token, 0, 0)
			game.make_move(player_token, 0, 1)
			game.make_move(player_token, 0, 2)
			result = game.winner?
			expect(result).to eq(player_token)
		end
	end

end


