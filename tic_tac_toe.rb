class TicTacToe
	def initialize(board, referee)
		@board = board
		@referee = referee
	end

	def make_mark(mark)
		if @last_player == mark.player_token
			raise NotPlayersTurnError.new('Player can not play twice in a row')
		end
		if @board.get_mark(mark.x_cooridinate, mark.y_cooridinate) != '-'
			raise InvalidMoveError.new('Player can not play twice in a row')
		end
		@board.mark(mark.player_token, mark.x_cooridinate, mark.y_cooridinate)
		@last_player = mark.player_token
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

class InvalidMoveError < StandardError
end

class Mark

	attr_accessor :player_token
	attr_accessor :x_cooridinate
	attr_accessor :y_cooridinate

	def initialize(player_token, x_cooridinate, y_cooridinate)
		@player_token  = player_token
		@x_cooridinate = x_cooridinate
		@y_cooridinate = y_cooridinate
	end
end

