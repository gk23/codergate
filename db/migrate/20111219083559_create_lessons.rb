class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :desc
      t.integer :course_id

      t.timestamps
    end
  end
end
