class Course < ActiveRecord::Base
	has_many :user_course_ships
	has_many :users, :through => :user_course_ships
end
