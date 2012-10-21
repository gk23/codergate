class ChangePwdToUsers < ActiveRecord::Migration
  def up
  	rename_column :users,:pwd,:password
  end

  def down
  	rename_column :users,:password,:pwd
  end
end
