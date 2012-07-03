class SessionsController < ApplicationController

	def new
	#
		
	end

	def login
		user = User.find_by_name(params[:user])
		if user and user.authenize params[:password]
			session[:user_id]  = user.id
			redirect_to course_url
		else
			redirect_to login_url,alert: "invalid user name or password."
		end
	end

	def create
		user = User.find_by_name(params[:user])
		if user and user.authenize params[:password]
			session[:user_id]  = user.id
			redirect_to course_url
		else
			redirect_to login_url,alert: "invalid user name or password."
		end

	end

	def destroy
		
	end
end