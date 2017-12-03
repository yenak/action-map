class AddColumnsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :email, :string
    add_column :people, :phone_number, :string
    add_column :people, :description, :string
  end
end
