class TicTacToe
	def initialize(board, referee)
		@board = board
		@referee = referee
	end

	def make_mark(mark, column, row)
		if @last_player == mark
			raise NotPlayersTurnError.new('Player has to play on their turn')
		end

		
		if !@board.get_mark(column, row).is_a?(UnplayedMark)
			raise InvalidMoveError.new('A move has already been made at that cooridinate')
		end

		@board.mark(mark, column, row)
		@last_player = mark
	end

	def winner?
		@referee.winner?(@board)
	end
end

class Board 
	def initialize
		@marks = [ 
			[UnplayedMark.new, UnplayedMark.new, UnplayedMark.new],
			[UnplayedMark.new, UnplayedMark.new, UnplayedMark.new],
			[UnplayedMark.new, UnplayedMark.new, UnplayedMark.new]
		]
	end

	def mark(player_mark, column, row)
		@marks[column][row] = player_mark
	end

	def get_mark(column, row)
		@marks[column][row]
	end
end

class Referee
	def winner?(board)
		if check_column_for_winner?(board, 0)
			board.get_mark(0, 0)
		elsif check_column_for_winner?(board, 1)
			board.get_mark(1, 0)
		elsif check_column_for_winner?(board, 2)
			board.get_mark(2, 0)
		elsif row_winner?(board, 0)
			board.get_mark(0, 0)
		elsif row_winner?(board, 1)
			board.get_mark(1, 1)
		else
			false
		end
	end

	private 

	def check_column_for_winner?(board, column)
		board.get_mark(column, 0) == board.get_mark(column, 1) && board.get_mark(column, 1) == board.get_mark(column, 2) && board.get_mark(column, 2) != '-'
	end

	def row_winner?(board, row)
		board.get_mark(0, row) == board.get_mark(1, row) && board.get_mark(1, row) == board.get_mark(2, row) && board.get_mark(2, row) != '-'
	end
end

class NotPlayersTurnError < StandardError
end

class InvalidMoveError < StandardError
end

class Mark
	attr_accessor :token
end

class PlayerMark < Mark
	def initialize(player_token)
		@token = player_token
	end
end

class UnplayedMark < Mark
	def initialize
		@token = '-'
	end
end
