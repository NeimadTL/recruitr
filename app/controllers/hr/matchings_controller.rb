class Hr::MatchingsController < ApplicationController

  before_action :authenticate_user!
  before_action :require_to_be_hr
  before_action :set_candidate
  before_action :set_position

  def suggest
    @interviewers = InterviewerMatcher.instance.interviewers_for(@candidate, @position)
  end

  def match
    selected_interviewers = User.where(id: params[:interviewee_interviewer_matching][:interviewer_id])
    @candidate.interviewers << selected_interviewers
    redirect_to hr_position_path(@position), notice: 'The candidate has been matched.'
  end

  def reject
    @candidate.withdraw(@position)
    @candidate.interviewers.clear
    redirect_to hr_position_path(@position), notice: 'The candidate has been rejected.'
  end

  private

    def set_candidate
      @candidate = User.find(params[:user_id])
    end

    def set_position
      @position = Position.find(params[:position_id])
    end

    def require_to_be_hr
      unless current_user.role.code == Role::HR_ROLE_CODE
        render :file => "#{Rails.root}/public/401", :layout => false, :status => :unauthorized
      end
    end

end
