require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	Given(:game) { TicTacToe.new }

	context "a move can be made" do
		it "a move can be made" do
			game.move
		end
	end

	context "determining a winner" do
		it "can determine if there is a winner" do
			game.winner?
		end
	end

end


