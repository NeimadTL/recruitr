class CreateUserPositionRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_position_requests do |t|
      t.integer :user_id, null: false
      t.integer :position_id, null: false


      t.timestamps
    end

    add_index :user_position_requests, [:user_id, :position_id], unique: true,
      name: 'user_position_index'
  end
end
