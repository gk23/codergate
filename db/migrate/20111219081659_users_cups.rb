class UsersCups < ActiveRecord::Migration
  def up
    create_table :users_cups do |t|
      t.integer :user_id
      t.integer :cup_id
      t.timestamps
    end
  end

  def down
    drop_table :users_cups
  end
end
