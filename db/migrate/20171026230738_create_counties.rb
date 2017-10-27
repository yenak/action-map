class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string :name, null: false
      t.references :states
      t.string :activity, default: "neutral"
      t.timestamps null: false
    end
  end
end
