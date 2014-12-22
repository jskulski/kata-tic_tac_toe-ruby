class TicTacToe
	def initialize(board, referee)
		@board = board
		@referee = referee
	end

	def make_mark(mark, x_cooridinate, y_cooridinate)
		if @last_player == mark
			raise NotPlayersTurnError.new('Player can not play twice in a row')
		end

		
		if !@board.get_mark(x_cooridinate, y_cooridinate).is_a?(UnplayedMark)
			raise InvalidMoveError.new('Player can not play twice in a row')
		end

		@board.mark(mark, x_cooridinate, y_cooridinate)
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

	def mark(player_mark, x_cooridinate, y_cooridinate)
		@marks[x_cooridinate][y_cooridinate] = player_mark
	end

	def get_mark(x_cooridinate, y_cooridinate)
		@marks[x_cooridinate][y_cooridinate]
	end
end

class Referee
	def winner?(board)
		if row_winner?(board, 0)
			board.get_mark(0, 0)
		elsif row_winner?(board, 1)
			board.get_mark(1, 0)
		else
			false
		end
	end

	private 

	def row_winner?(board, row)
		board.get_mark(row, 0) == board.get_mark(row, 1) && board.get_mark(row, 1) == board.get_mark(row, 2) && board.get_mark(row, 2) != '-'
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
