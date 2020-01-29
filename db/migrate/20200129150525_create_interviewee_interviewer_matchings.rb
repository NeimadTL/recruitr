class CreateIntervieweeInterviewerMatchings < ActiveRecord::Migration[6.0]
  def change
    create_table :interviewee_interviewer_matchings do |t|
      t.integer :interviewee_id, null: false
      t.integer :interviewer_id, null: false

      t.timestamps
    end

    add_index :interviewee_interviewer_matchings, [:interviewee_id, :interviewer_id], unique: true,
      name: 'interviewee_interviewer_index'
  end
end
