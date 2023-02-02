class RemoveIndexUsersGroupId < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, column: :group_id
  end
end
