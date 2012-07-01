class PagesController < ApplicationController
  
	def home
		@title = "Homepage"
    @posts = Post.where(:category => "News").limit(5)
        @games = Game.find(:all, :conditions => ["kickoff > ?", Time.now],
                    :order => 'kickoff ASC', :limit => 9)
		if user_signed_in?
			@user = current_user
			@bets = @user.bets
		end
	end

	def admin
		@title = "Admin Overview"
	end

	def about
		@title = "About this"
	end

	def rules
		@title = "Reglas"
	end

	def impressum
		@title = "Masthead"
	end

end
