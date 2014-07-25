class Game 

	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
		@players = [@player1, @player2]
		@multi_players = []
	end

	BEATS = {rock: :scissors, scissors: :paper, paper: :rock}

	attr_reader :players, :player1, :player2, :multi_players

	def winner
		return "Draw" if player1.pick == player2.pick
		return player1  if BEATS[normalize(player1.pick)] == normalize(player2.pick)
		player2
	end

	def normalize(pick)
		pick.downcase.to_sym
	end

	def add(player)
		@multi_players << player
	end

	def start?
		@multi_players.count == 2
	end

end