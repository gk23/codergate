class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :uid
      t.string :cups
      t.integer :exercise_num
      t.integer :lesson_num

      t.timestamps
    end
  end
end
