class SessionsController < ApplicationController

	# 显示登录页面
	def login

	end

	# 验证用户并转向主页
	def create
		logger.debug "Comming in SessionsController#create method."
		user = User.find_by_mail(params[:mail])
		logger.debug "#{user}"
		if user and User.authenticate(params[:mail],params[:pwd])
			session[:user_id]  = user.id
			@user_courses = User_courses.find_by_user(user.id)
			redirect_to courses_path
		else
			redirect_to login_path,alert: "invalid user name or password."
		end

	end

	def destroy
		
	end
end