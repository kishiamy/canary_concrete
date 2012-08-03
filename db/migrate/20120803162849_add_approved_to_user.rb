class AddApprovedToUser < ActiveRecord::Migration
  def self.change
    add_column :users, :approved, :boolean, :default =>false, :null => false
    add_index :users, :approved
  end
end
