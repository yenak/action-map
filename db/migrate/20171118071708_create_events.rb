class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :state
      t.string :county
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
