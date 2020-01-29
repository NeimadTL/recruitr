class Hr::MatchingsController < ApplicationController

  def suggest
    @candidate = User.find(params[:user_id])
    @interviewers = InterviewerMatcher.new.interviewers_for(@candidate)
  end

end
