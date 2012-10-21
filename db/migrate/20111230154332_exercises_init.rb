require 'active_record/fixtures'
class ExercisesInit < ActiveRecord::Migration
  def up
  	down
    dir = File.join(File.dirname(__FILE__),'dev_data')
    ActiveRecord::Fixtures.create_fixtures(dir,"exercises")
  end

  def down
  	Exercise.delete_all
  end
end
