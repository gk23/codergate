class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.column "name",:string,:limit=>80
      t.column "desc",:string,:limit=>255
      t.column "levels",:string,:limit=>20
      t.timestamps
    end
  end
end
