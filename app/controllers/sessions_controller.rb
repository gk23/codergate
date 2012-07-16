class SessionsController < ApplicationController
	skip_before_filter :auth
	layout :false
	# 显示登录页面
	def login
		session[:user_id] = nil
	end

	# 验证用户并转向主页
	def create
		logger.debug "Comming in SessionsController#create method."
		user = User.find_by_mail(params[:mail])
		
		if is_pass?(params[:mail],params[:password])
			session[:user_id]  = user.id
			session[:user_name] = user.name
			@user = User.find(user.id)
			courses = user.courses
			logger.debug "#{courses}"
			redirect_to courses_path
		else
			redirect_to login_path,alert: "invalid user name or password."
		end

	end

	def destroy
		session[:user_id] = nil
		session[:user_name] = nil
		redirect_to :login 
	end

	def is_pass?(mail,password)
		user = User.find_by_mail(mail)
		logger.debug "#{user}"
		user and User.authenticate(mail,password)
	end

end