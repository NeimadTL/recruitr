require 'rails_helper'

RSpec.describe InterviewerMatcher do

  let(:candidate) {
    User.create!(firstname: "John", lastname: "DOE", city: "Brussels",
      country: "Belgium", email: "john_doe@gmail.com", password: "Gimethepass20",
      password_confirmation: "Gimethepass20", role_id: Role::CANDIDATE_ROLE_CODE)
  }

  let(:position) {
    Position.create!(title: 'worker required', description: 'best job description ever')
  }

  it "should suggest no interviewers as the candidate's skills doesn't match the position's skills" do
    position.skills << Skill.find_by(name: 'Ruby')
    candidate.skills << Skill.find_by(name: 'Marketing')
    candidate.apply(position)
    interviewers = Hr::MatchingsController::interviewers_for(candidate, position)
    expect(interviewers.empty?).to be true
  end


  it "should suggest interviewers as the candidate's skills match the position's skills" do
    position.skills << Skill.find_by(name: 'Community')
    position.skills << Skill.find_by(name: 'Marketing')
    position.skills << Skill.find_by(name: 'Communication')
    candidate.skills << Skill.find_by(name: 'Communication')
    candidate.skills << Skill.find_by(name: 'Marketing')
    candidate.apply(position)
    interviewers = Hr::MatchingsController::interviewers_for(candidate, position)
    expect(interviewers.count).to eql 2
    expect(interviewers[0].firstname).to eql 'Kyle'
    expect(interviewers[0].lastname).to eql 'SIMPSON'
    expect(interviewers[1].firstname).to eql 'Kelly'
    expect(interviewers[1].lastname).to eql 'JOHNSON'
  end

  it "should suggest no interviewers as the match rate is not strong enough between
    the candidate's skills and the position's skills" do
    position.skills << Skill.find_by(name: 'Community')
    position.skills << Skill.find_by(name: 'Marketing')
    position.skills << Skill.find_by(name: 'Communication')
    candidate.skills << Skill.find_by(name: 'Marketing')
    candidate.apply(position)
    interviewers = Hr::MatchingsController::interviewers_for(candidate, position)
    expect(interviewers.empty?).to be true
  end

  it "should suggest HR as a default interviewer(s) as the candidate's skills
    match position's skills but no one can assess the candidate with the company" do
    position.skills << Skill.find_by(name: 'Credit')
    position.skills << Skill.find_by(name: 'Finance')
    candidate.skills << Skill.find_by(name: 'Credit')
    candidate.skills << Skill.find_by(name: 'Finance')
    candidate.apply(position)
    interviewers = Hr::MatchingsController::interviewers_for(candidate, position)
    expect(interviewers.count).to eql 1
    expect(interviewers[0].firstname).to eql 'HR'
    expect(interviewers[0].lastname).to eql 'RECRUITR'
  end

end
