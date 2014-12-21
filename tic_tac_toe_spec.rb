require 'rspec-given'
require_relative 'spec_helper'

describe "Tic Tac Toe" do

	Given(:game) { TicTacToe.new }

	it "game can be created" do
	end

	it "a move can be made" do
		game.move
	end

	it "can determine if there is a winner" do
		game.winner?
	end
	
end


