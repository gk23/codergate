class User < ActiveRecord::Base
	has_many :user_course_ships 
	has_many :courses,:through => :user_course_ships

	has_many :user_cup_ships
	has_many :cups,:through =>:user_cup_ships

	validates :mail, :presence => true, :uniqueness => true
	validates :password, :presence=>true,:confirmation => true
	# attr_accessor :pwd_confirmation
	#attr_reader :password
	 
	def User.authenticate(mail,password)
		logger.debug "in User#authenticate method, mail is #{mail} password is #{password}"
		if user = find_by_mail(mail)
			logger.debug "the user's password should be #{user.password}, the entered password is #{password}"
			if password == user.password
				logger.debug "validate success,the password is correct."
				user
			end
		end
	end

	def User.find_completed_courses(user_id)
		courses = User.find(user_id).courses
		completed_courses = []
		courses.each  do |course| 
			logger.debug "the course id is #{course.id}, the name is #{course.name}"
			progress = UserCourseShip.find_progress(user_id,course.id)
			logger.debug "the progress is #{progress}"
			if progress!=nil and progress == 1
				completed_courses.push(course)
			end
		end
		return completed_courses	  	
	end  

	def User.find_uncompleted_courses(user_id)
		courses = User.find(user_id).courses
		uncompleted_courses = []
		courses.each do |course| 
			progress = UserCourseShip.find_progress(user_id,course.id)
			if progress != 1
				uncompleted_courses.push(course)
			end
		end
		return uncompleted_courses
	end

	def User.find_courses(user_id)
		return nil unless user_id
		return User.courses
	end


end
