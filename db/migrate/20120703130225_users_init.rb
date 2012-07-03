require 'active_record/fixtures'
class UsersInit < ActiveRecord::Migration
  def up
  	down
  	dir = File.join(File.dirname(__FILE__),'dev_data')
  	ActiveRecord::Fixtures.create_fixtures(dir,"users")
  end

  def down
  	User.delete_all
  end
end
