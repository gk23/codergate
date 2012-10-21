class CreateCups < ActiveRecord::Migration
  def change
    create_table :cups do |t|
      t.string :name
      t.text :desc
      t.string :image
      t.string :filter

      t.timestamps
    end
  end
end
