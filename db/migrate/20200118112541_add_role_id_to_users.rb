class AddRoleIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role_id, :integer, default: Role::CANDIDATE_ROLE_CODE, null: false
  end
end
