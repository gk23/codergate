class User < ActiveRecord::Base
	 validates :name, :presence => true, :uniqueness => true
	 validates :password, :confirmation => true
	 attr_accessor :password_confirmation
	 attr_reader :password
	 validate :password_must_be_present

	 def User.authenticate(mail,pwd)
	 		logger.debug "in User#authenticate method, mail is #{mail} password is #{pwd}"
	 	  	if user = find_by_mail(mail)
	 	  		if pwd == user.pwd
	 	  			user
	 	  		end
	 	  	end
	 end  
end
