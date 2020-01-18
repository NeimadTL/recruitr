class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.integer :code, null: false
      t.string :name, default: "", null: false

      t.timestamps
    end
  end
end
