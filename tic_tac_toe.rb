class TicTacToe
	def initialize
		@board = [ 
			['-', '-', '-'],
			['-', '-', '-'],
			['-', '-', '-']
		]
	end

	def make_move(player_token, x_cooridinate, y_cooridinate)
		mark_board_with_token(@board, player_token, x_cooridinate, y_cooridinate)
	end

	def winner?
		determine_winner(@board)
	end

	def mark_board_with_token(board, player_token, x_cooridinate, y_cooridinate)
		board[x_cooridinate][y_cooridinate] = player_token
	end

	def determine_winner(board)
		if board[0][0] == board[0][1] && board[0][1] == board[0][2]
			board[0][2]
		else
			false
		end
	end
end

