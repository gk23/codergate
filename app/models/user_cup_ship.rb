class UserCupShip < ActiveRecord::Base
    belongs_to :user
    belongs_to :cup

end
