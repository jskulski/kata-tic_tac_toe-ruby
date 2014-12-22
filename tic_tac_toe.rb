class TicTacToe
	def initialize(board, referee)
		@board = board
		@referee = referee
	end

	def make_move(player_token, x_cooridinate, y_cooridinate)
		@board.mark(player_token, x_cooridinate, y_cooridinate)
	end

	def winner?
		@referee.winner?(@board)
	end

end

class Board 
	def initialize
		@marks = [ 
			['-', '-', '-'],
			['-', '-', '-'],
			['-', '-', '-']
		]
	end

	def mark(player_token, x_cooridinate, y_cooridinate)
		@marks[x_cooridinate][y_cooridinate] = player_token
	end

	def get_mark(x_cooridinate, y_cooridinate)
		@marks[x_cooridinate][y_cooridinate]
	end
end

class Referee
	def winner?(board)
		if board.get_mark(0,0) == board.get_mark(0,1) && board.get_mark(0,1) == board.get_mark(0,2)
			board.get_mark(0,2)
		else
			false
		end
	end
end