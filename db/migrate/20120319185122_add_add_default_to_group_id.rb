class AddAddDefaultToGroupId < ActiveRecord::Migration
  def change
    change_column(:users, :group_id, :integer, :default => 2)
  end
end
