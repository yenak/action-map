class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :birthday
      t.string :sex

      t.timestamps null: false
    end
  end
end
