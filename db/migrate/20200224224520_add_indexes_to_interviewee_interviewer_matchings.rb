class AddIndexesToIntervieweeInterviewerMatchings < ActiveRecord::Migration[6.0]
  def change
    add_index :interviewee_interviewer_matchings, :interviewee_id
    add_index :interviewee_interviewer_matchings, :interviewer_id
  end
end
