class UsersController < ApplicationController
	include DateTimeHelper
	
	def index
		@articles = Article.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@markdown= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
	end

	def create
		@user = User.new user_params
		if @user.save
			flash[:success] = "Register success"
			redirect_to root_path
		else
			flash[:success] = "Register failed"
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit :name, :password, :password_confirmation
	end
end
