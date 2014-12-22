require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	Given(:board) { Board.new }
	Given(:referee) { Referee.new }
	Given(:game) { TicTacToe.new(board, referee) }

	Given(:player_one) { PlayerMark.new("X") }
	Given(:player_two) { PlayerMark.new("Y") }

	context "board" do
		it "is initially unplayed marks" do
			expect(board.get_mark(1,1)).to be_a(UnplayedMark)
		end

		it "when a player makes a mark we get it back" do
			game.make_mark(player_two, 1, 1)
			expect(board.get_mark(1,1)).to be_a(PlayerMark)
		end
	end

	context "plays complete games" do 
		it "detects a winning top row for X" do 
			game.make_mark(player_one, 0, 0)
			game.make_mark(player_two, 1, 1)
			game.make_mark(player_one, 0, 1)
			game.make_mark(player_two, 1, 2)
			game.make_mark(player_one, 0, 2)

			result = game.winner?
			expect(result).to eq(player_one)
		end

		it "detects a winning top row for Y" do 
			game.make_mark(player_one, 2, 0)
			game.make_mark(player_two, 0, 0)
			game.make_mark(player_one, 2, 1)
			game.make_mark(player_two, 0, 1)
			game.make_mark(player_one, 1, 2)
			game.make_mark(player_two, 0, 2)

			result = game.winner?
			expect(result).to eq(player_two)
		end

		it "detects no winner if there is not winner in top row" do
			game.make_mark(player_one, 0, 0)
			game.make_mark(player_two, 0, 1)
			game.make_mark(player_one, 0, 2)

			result = game.winner?
			expect(result).to eq(false)
		end

		it "detects a winner for the middle row for player one" do
			game.make_mark(player_one, 1, 0)
			game.make_mark(player_two, 2, 0)
			game.make_mark(player_one, 1, 1)
			game.make_mark(player_two, 2, 1)
			game.make_mark(player_one, 1, 2)

			result = game.winner?
			expect(result).to eq(player_one)
		end
	end

	context "follows the rules" do
		it "a player can't play twice in a row" do
			game.make_mark(player_one, 0, 0)

			expect{ 
				game.make_mark(player_one, 0, 1)
			}.to raise_error(NotPlayersTurnError)
		end

		it "a player can't play where a move has been made" do
			game.make_mark(player_one, 0, 0)

			expect{ 
				game.make_mark(player_two, 0, 0)
			}.to raise_error(InvalidMoveError)
		end
	end

end


