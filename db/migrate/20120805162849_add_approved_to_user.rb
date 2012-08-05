class AddApprovedToUser < ActiveRecord::Migration
  def change
    add_column :users, :approved, :boolean, :null => false
  end
end
