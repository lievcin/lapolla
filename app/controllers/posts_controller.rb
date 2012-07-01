class PostsController < ApplicationController

	before_filter :authenticate_user!
	
	def index
		@title = "List of posts"
		@posts = Post.all
	end

	def news
		@title = "News"
		@posts = Post.news.all
	end

	def show
		@title = "View Post"
		@post = Post.find(params[:id])
	end

	def new
		@title = "New Post"
		@post = Post.new
	end

	def edit
		@title = "Edit Post"
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params[:post])

		if @post.save
			flash[:success] = "Post successfully created."
			redirect_to @post
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			flash[:success] = "Post updated."
			redirect_to @post
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def destroy
		Post.find(params[:id]).destroy
		flash[:success] = "Post destroyed"
		redirect_to :back
	end
end
