class TeamsController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "List of Teams"
		@teams = Team.all
	end

	def show
		@title = "Team view"
		@team = Team.find(params[:id])
	end

	def new
		@title = "New Team"
		@team = Team.new
	end

	def edit
		@title = "Edit Team"
		@team = Team.find(params[:id])
	end

	def create
		@team = Team.new(params[:team])

		if @team.save
			flash[:success] = "Team successfully created"
			redirect_to teams_path
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def update
		@team = Team.find(params[:id])

		if @team.update_attributes(params[:team])
			flash[:success] = "Team Edited."
			redirect_to teams_path
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def destroy
		Team.find(params[:id]).destroy
		flash[:success] = "Team deleted"
		redirect_to :back
	end
end
