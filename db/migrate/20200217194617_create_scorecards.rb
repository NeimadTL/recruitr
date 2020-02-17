class CreateScorecards < ActiveRecord::Migration[6.0]
  def change
    create_table :scorecards do |t|
      t.integer :experience
      t.integer :dynamism
      t.integer :interest

      t.timestamps
    end
  end
end
