class CreateUserCupShips < ActiveRecord::Migration
  def change
    create_table :user_cup_ships do |t|
      t.integer :user_id
      t.integer :cup_id

      t.timestamps
    end
  end
  def down
  	drop_table :user_cup_ships
  end
end
