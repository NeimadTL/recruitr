require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }
  it { should validate_presence_of :city }
  it { should validate_presence_of :country }

  it { should belong_to :role }

  it { should have_many :user_skill_taggings }
  it { should have_many :skills }

  it { should have_many :user_position_requests }
  it { should have_many :applications }

  it { should have_many :interviewer_matchings }
  it { should have_many :interviewers }

  it { should have_many :interviewee_matchings }
  it { should have_many :interviewees }

  let(:candidate) {
    User.create!(firstname: "John", lastname: "DOE", city: "Brussels",
      country: "Belgium", email: "john_doe@gmail.com", password: "Gimethepass20",
      password_confirmation: "Gimethepass20", role_id: Role::CANDIDATE_ROLE_CODE)
  }

  let(:position){
    Position.create!(title: "Backend engineer",
      description: "this is the best job description I've ever written")
  }

  it "should apply and withdraw an application" do
    expect(candidate.applied?(position)).to be false
    candidate.apply(position)
    expect(candidate.applied?(position)).to be true
    expect(candidate.applications.include?(position)).to be true
    candidate.withdraw(position)
    expect(candidate.applications.include?(position)).to be false
    expect(candidate.applied?(position)).to be false
  end

end
