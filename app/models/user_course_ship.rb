class UserCourseShip < ActiveRecord::Base
	belongs_to :user
	belongs_to :course

    def UserCourseShip.find_progress(user_id,course_id)
        logger.debug("In the method of UserCourseShip.find_progress, the user_id is #{user_id}, the course_id is #{course_id}")
        ucs = UserCourseShip.where("user_id=? and course_id=?",user_id,course_id).first
        return nil unless ucs
        return ucs.progress_completed
    end

    def UserCourseShip.add_course(user_id,course_id)
        
    end
end
