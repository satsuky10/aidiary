class RemoveIndexUsersIndexUsersOnGroupId < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, column: :index_users_on_group_id
  end
end
