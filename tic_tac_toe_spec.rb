require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	Given(:board) { Board.new }
	Given(:referee) { Referee.new }
	Given(:game) { TicTacToe.new(board, referee) }

	Given(:player_one_token) { "X" }
	Given(:player_two_token) { "Y" }

	context "board" do
		it "is initially unplayed marks" do
			expect(board.get_mark(1,1)).to eq('-')
		end
	end

	context "plays complete games" do 
		it "detects a winning top row for X" do 
			game.make_mark(Mark.new(player_one_token), 0, 0)
			game.make_mark(Mark.new(player_two_token), 1, 1)
			game.make_mark(Mark.new(player_one_token), 0, 1)
			game.make_mark(Mark.new(player_two_token), 1, 2)
			game.make_mark(Mark.new(player_one_token), 0, 2)

			result = game.winner?
			expect(result).to eq(player_one_token)
		end

		it "detects a winning top row for Y" do 
			game.make_mark(Mark.new(player_one_token), 2, 0)
			game.make_mark(Mark.new(player_two_token), 0, 0)
			game.make_mark(Mark.new(player_one_token), 2, 1)
			game.make_mark(Mark.new(player_two_token), 0, 1)
			game.make_mark(Mark.new(player_one_token), 1, 2)
			game.make_mark(Mark.new(player_two_token), 0, 2)

			result = game.winner?
			expect(result).to eq(player_two_token)
		end

		it "detects no winner if there is not winner in top row" do
			game.make_mark(Mark.new(player_one_token), 0, 0)
			game.make_mark(Mark.new(player_two_token), 0, 1)
			game.make_mark(Mark.new(player_one_token), 0, 2)

			result = game.winner?
			expect(result).to eq(false)
		end

		it "detects a winner for the middle row for player one" do
			game.make_mark(Mark.new(player_one_token), 1, 0)
			game.make_mark(Mark.new(player_two_token), 2, 0)
			game.make_mark(Mark.new(player_one_token), 1, 1)
			game.make_mark(Mark.new(player_two_token), 2, 1)
			game.make_mark(Mark.new(player_one_token), 1, 2)

			result = game.winner?
			expect(result).to eq(player_one_token)
		end
	end

	context "follows the rules" do
		it "a player can't play twice in a row" do
			game.make_mark(Mark.new(player_one_token), 0, 0)

			expect{ 
				game.make_mark(Mark.new(player_one_token), 0, 1)
			}.to raise_error(NotPlayersTurnError)
		end

		it "a player can't play where a move has been made" do
			game.make_mark(Mark.new(player_one_token), 0, 0)

			expect{ 
				game.make_mark(Mark.new(player_two_token), 0, 0)
			}.to raise_error(InvalidMoveError)
		end
	end

end


