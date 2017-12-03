class AddActivitiesToStates < ActiveRecord::Migration
  def change
    add_column :states, :immigration_activity, :string, default: "i_neutral"
    add_column :states, :gun_control_activity, :string, default: "gc_neutral"
    add_column :states, :environment_activity, :string, default: "e_neutral"
  end
end
