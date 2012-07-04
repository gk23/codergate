require 'active_record/fixtures'
class UserCupShipsInit < ActiveRecord::Migration
  def up
    down
    dir = File.join(File.dirname(__FILE__),'dev_data')
    ActiveRecord::Fixtures.create_fixtures(dir,'user_cup_ships')
  end

  def down
    UserCupShip.delete_all
  end
end
