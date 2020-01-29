class Hr::MatchingsController < ApplicationController
  before_action :set_candidate

  def suggest
    @interviewers = InterviewerMatcher.new.interviewers_for(@candidate)
  end

  def match
    selected_interviewers = User.where(id: params[:interviewee_interviewer_matching][:interviewer_id])
    @candidate.interviewers << selected_interviewers
    redirect_to hr_positions_path, notice: 'The candidate has been matched.'
  end

  private

    def set_candidate
      @candidate = User.find(params[:user_id])
    end

end
