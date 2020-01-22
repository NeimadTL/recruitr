class AddDescriptionToPositions < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :description, :text, default: "", null: false
  end
end
