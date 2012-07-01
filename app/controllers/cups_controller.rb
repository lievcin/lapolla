class CupsController < ApplicationController

  # before_filter :authenticate_admin!
	
	def index
		@title = "Overview competitions"
		@cups = Cup.all
	end

	def new
		@title = "Create competition"
		@cup = Cup.new
	end

	def edit
		@title = "Competition progress"
		@cup = Cup.find(params[:id])
	end

	def create
		@cup = Cup.new(params[:cup])

		if @cup.save
			flash[:success] = "Successfully Created"
			redirect_to @cup
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def update
		@cup = Cup.find(params[:id])

		if @cup.update_attributes(params[:cup])
			flash[:success] = "Competitive Progress"
			redirect_to @cup
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def destroy
		Cup.find(params[:id]).destroy
		flash[:success] = "Competition deleted"
		redirect_to :back
	end

	def choose_teams
		@cup = Cup.find(params[:id])
	end
end
