require 'active_record/fixtures'
class UserCourseShipsInit < ActiveRecord::Migration
  def up
    down
    dir = File.join(File.dirname(__FILE__),'dev_data')
    ActiveRecord::Fixtures.create_fixtures(dir,'user_course_ships')
  end

  def down
    UserCourseShip.delete_all
  end
end
