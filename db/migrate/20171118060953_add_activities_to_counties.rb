class AddActivitiesToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :immigration_activity, :string, default: "i_neutral"
    add_column :counties, :gun_control_activity, :string, default: "gc_neutral"
    add_column :counties, :environment_activity, :string, default: "e_neutral"
  end
end
