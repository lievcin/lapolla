class RoundsController < ApplicationController

  before_filter :authenticate_user!
	
	def index
		@title = "Rounds"
		@cup = Cup.find(params[:cup_id])
		@rounds = Round.where( :cup_id => @cup.id).order("leg")
	end

	def show
	end

	def new
		@title = "Create Round"
		@cup = Cup.find(params[:cup_id])
		@round = Round.new
	end

	def edit
		@title = "Edit Round"
		@cup = Cup.find(params[:cup_id])
		@round = Round.find(params[:id])
	end

	def create
		@round = Round.new(params[:round])
		@cup = Cup.find(params[:cup_id])

		if @round.save
			flash[:success] = "Round Created Successfully"
			redirect_to cup_rounds_url(@cup)
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def update
		@round = Round.find(params[:id])
		@cup = Cup.find(params[:cup_id])

		if @round.update_attributes(params[:round])
			flash[:success] = "Successfully updated Round."
			redirect_to cup_rounds_url(@cup)
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def destroy
		Round.find(params[:id]).destroy
		flash[:success] = "Round Deleted"
		redirect_to :back
	end

end
