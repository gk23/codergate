class AddColumnToUser < ActiveRecord::Migration
  def up
  	add_column :users,:pwd, :string
  	add_column :users,:is_active,:boolean,:default =>false 	
  end
  
  def down
    remove_column :users,:pwd
  	remove_column :users,:is_active	
  end
end
