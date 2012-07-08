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
end
