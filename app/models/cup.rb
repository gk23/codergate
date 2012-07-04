class Cup < ActiveRecord::Base
    has_many :user_cup_ships
    has_many :users,:through=>:user_cup_ships
end
