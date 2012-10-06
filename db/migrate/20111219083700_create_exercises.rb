class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :desc
      t.string :instructions
      t.string :hint
      t.string :default_code
      t.string :correct_code
      t.integer :lesson_id
      t.timestamps
    end
  end
end
