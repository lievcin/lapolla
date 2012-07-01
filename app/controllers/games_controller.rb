class GamesController < ApplicationController

  before_filter :authenticate_admin!
	
	def index
		@title = "List of Games"

		if params[:round_id].nil?
			next_game = Game.where("kickoff >= ?", Time.now).first
			@round = Round.find(next_game.round_id)
			@cup = Cup.find(@round.cup_id)
			@games = Game.where(:round_id => next_game.round_id)
		else
			@round = Round.find(params[:round_id])
			@cup = Cup.find(@round.cup_id)
			@games = Game.where(:round_id => params[:round_id])
		end
	end

	def show
		@title = "View Game"
		@game = Game.find(params[:id])
		@round = Round.find(@game.round_id)
		@cup = Cup.find(@round.cup_id)
	end

	def new
		@title = "New Game"
		@cup = Cup.find(params[:cup_id])
		@round = Round.find(params[:round_id])
		@game = Game.new
		@teams = Team.order("name ASC")
	end

	def edit
		@title = "Edit Game"
		@game = Game.find(params[:id])
		@round = Round.find(@game.round_id)
		@cup = Cup.find(@round.cup_id)
		@teams = Team.all
	end

	def create
		@game = Game.new(params[:game])

		if @game.save
			flash[:success] = "Game successfully created"
			redirect_to @game
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def update
		@game = Game.find(params[:id])

		if @game.update_attributes(params[:game])
			flash[:success] = "Game Edited"
			redirect_to @game
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def destroy
		Game.find(params[:id]).destroy
		flash[:success] = "Game Destroyed"
		redirect_to :back
	end

	def result_index
		@title = "Enter Results"
		@games = Game.where( :home_score => nil).order(:kickoff)
	end

	def fix_result
		@title = "Enter Result"
		@game = Game.find(params[:id])
	end

	def save_result
		@game = Game.find(params[:id])
		@bets = Bet.find_all_by_game_id(@game.id)

		if @game.update_attributes(params[:game])
			flash[:success] = "Results saved"
			# do some point-updating here
			@bets.each do |bet|
				p = points_per_game(@game.home_score, @game.away_score, bet.home_bet, bet.away_bet)
				bet.points = p
				bet.save
				flash[:success] = "Points assigned"
			end
			redirect_to result_index_games_path
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	private

	def points_per_game(home_score, away_score, home_bet, away_bet)
		if home_score == home_bet && away_score == away_bet
			return 3
		else
			if (home_score - away_score) - (home_bet - away_bet) == 0 
				if home_score == away_score 
					return 1
				else
					return 2
				end
			else
				if ((home_score - away_score) <=> 0) == ((home_bet - away_bet) <=> 0) 
					return 1
				else
					return 0
				end
			end
		end
	end

end
