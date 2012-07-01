module BetsHelper

	def sum_points(user, games)
		p = 0
		games.each do |game|
			userbet = user.bets.where(:game_id => game.id).first
			unless userbet.nil?
				unless userbet.points.nil?
					p = p + userbet.points
				end
			end
		end
		return p
	end

	def get_round_points(user, round)
		bets = round.bets.where(:user_id => user.id)
		round_points = 0
		bets.each do |bet|
			unless bet.nil?
				unless bet.points.nil?
					round_points = round_points ++ bet.points
				end
			end
		end
		return round_points
	end

	def get_cup_points(user, cup)
		cup_points = 0
		rounds = cup.rounds
		rounds.each do |round|
			unless round.nil?
				round_points = 0
				bets = round.bets.where(:user_id => user.id)
				bets.each do |bet|
					unless bet.nil?
						unless bet.points.nil?
							round_points = round_points ++ bet.points
						end
					end
				end
				cup_points = cup_points ++ round_points
			end
		end
		return cup_points
	end

end
