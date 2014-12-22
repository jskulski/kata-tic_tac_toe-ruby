class TicTacToe
	def initialize(board, referee)
		@board = board
		@referee = referee
	end

	def make_mark(player_token, x_cooridinate, y_cooridinate)
		if @last_player == player_token
			raise NotPlayersTurnError.new('Player can not play twice in a row')
		end
		@board.mark(player_token, x_cooridinate, y_cooridinate)
		@last_player = player_token
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
		if row_winner?(board, 0)
			board.get_mark(0,2)
		else
			false
		end
	end

	private 

	def row_winner?(board, row)
		board.get_mark(row, 0) == board.get_mark(row, 1) && board.get_mark(row, 1) == board.get_mark(row, 2)
	end
end

class NotPlayersTurnError < StandardError
end