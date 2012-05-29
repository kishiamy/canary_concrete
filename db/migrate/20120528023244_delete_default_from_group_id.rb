class DeleteDefaultFromGroupId < ActiveRecord::Migration

  def change
    change_column_default(:users, :group_id, nil)       
  end
end
