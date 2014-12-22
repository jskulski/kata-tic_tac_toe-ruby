class TicTacToe
	def make_move(player_token, x_cooridinate, y_cooridinate)
		@player_token = player_token
	end

	def winner?
		@player_token
	end
end