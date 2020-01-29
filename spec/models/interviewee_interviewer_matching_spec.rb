require 'rails_helper'

RSpec.describe IntervieweeInterviewerMatching, type: :model do

  it { should belong_to :interviewer }
  it { should belong_to :interviewee }


end
