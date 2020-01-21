class CreateUserSkillTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_skill_taggings do |t|
      t.integer :user_id, null: false
      t.integer :skill_id, null: false

      t.timestamps
    end

    add_index :user_skill_taggings, [:user_id, :skill_id], unique: true,
      name: 'user_skill_index'
  end
end
