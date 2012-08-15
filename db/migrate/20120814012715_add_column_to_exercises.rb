class AddColumnToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :instructions, :string
    add_column :exercises, :hint, :string
    add_column :exercises, :default_code, :string
    add_column :exercises, :correct_code, :string
  end

  def down
      remove_column :exercises, :instructions
      remove_column :exercises, :hint
      remove_column :exercises, :default_code
      remove_column :exercises, :correct_code
  end
end
