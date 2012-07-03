class UsersCourses < ActiveRecord::Migration
  def up
    create_table :users_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :lesson_id
      t.integer :exercise_id
      t.timestamps
    end 
  end

  def down
    drop_table :users_courses
  end
end
