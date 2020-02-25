class AddIndexesToUserPositionRequests < ActiveRecord::Migration[6.0]
  def change
    add_index :user_position_requests, :user_id
    add_index :user_position_requests, :position_id
  end
end
