class CreateUserCourseShips < ActiveRecord::Migration
  def change
    create_table :user_course_ships do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :lesson_id
      t.integer :exercise_id

      t.timestamps
    end
  end

  def self.down
  	drop_table :user_course_ships
  end
end
