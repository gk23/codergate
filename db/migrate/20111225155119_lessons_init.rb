require 'active_record/fixtures'
class LessonsInit < ActiveRecord::Migration
  def up
    down
    dir = File.join(File.dirname(__FILE__),'dev_data')
    ActiveRecord::Fixtures.create_fixtures(dir,"lessons")
  end

  def down
    Lesson.delete_all
  end
end
