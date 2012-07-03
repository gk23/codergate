require 'active_record/fixtures'
class CupsInit < ActiveRecord::Migration
  def up
    down
    dir = File.join(File.dirname(__FILE__),'dev_data')
    ActiveRecord::Fixtures.create_fixtures(dir,"cups")
  end

  def down
    Cup.delete_all
  end
end
