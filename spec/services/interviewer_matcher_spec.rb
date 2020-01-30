require 'rails_helper'

RSpec.describe InterviewerMatcher do

  let(:candidate) {
    User.create!(firstname: "John", lastname: "DOE", city: "Brussels",
      country: "Belgium", email: "john_doe@gmail.com", password: "Gimethepass20",
      password_confirmation: "Gimethepass20", role_id: Role::CANDIDATE_ROLE_CODE)
  }


  it "should suggest interviewers matching the skills of the candidate" do
    candidate.skills << Skill.find_by(name: 'Marketing')
    interviewers = Hr::MatchingsController::interviewers_for(candidate)
    expect(interviewers.count).to eql 2
    expect(interviewers[0].firstname).to eql 'Kyle'
    expect(interviewers[0].lastname).to eql 'SIMPSON'
    expect(interviewers[1].firstname).to eql 'Kelly'
    expect(interviewers[1].lastname).to eql 'JOHNSON'
  end

  it "should suggest no interviewers when there is no matching for candidate's skills" do
    candidate.skills << Skill.find_by(name: 'Credit')
    interviewers = Hr::MatchingsController::interviewers_for(candidate)
    expect(interviewers.empty?).to be true
  end

end
