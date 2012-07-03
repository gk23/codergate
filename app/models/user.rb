class User < ActiveRecord::Base
	has_many :user_course_ships 
	has_many :courses,:through => :user_course_ships
	 validates :mail, :presence => true, :uniqueness => true
	 validates :pwd, :presence=>true,:confirmation => true
	 attr_accessor :pwd_confirmation
	 attr_reader :pwd
	 

	 def User.authenticate(mail,pwd)
	 		logger.debug "in User#authenticate method, mail is #{mail} password is #{pwd}"
	 	  	if user = find_by_mail(mail)
	 	  		if pwd == user.pwd
	 	  			user
	 	  		end
	 	  	end
	 end  
end
