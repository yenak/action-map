class AddSymbolToStates < ActiveRecord::Migration
  def change
    add_column :states, :symbol, :string
  end
end
