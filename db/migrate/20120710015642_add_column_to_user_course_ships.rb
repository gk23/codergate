class AddColumnToUserCourseShips < ActiveRecord::Migration
  def up
    add_column :user_course_ships, :progress_completed, :decimal,:precision=>3, :scale =>2
  end

  def down
    remove_column :user_course_ships,:progress_completed
  end
end
