class AddDefaultValueToColumn < ActiveRecord::Migration
  def change
    change_column_default :users, :approved, false
  end
end
