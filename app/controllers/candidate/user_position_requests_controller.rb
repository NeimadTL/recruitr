class Candidate::UserPositionRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_to_be_candidate

  def create
    position = Position.find(params[:position_id])
    current_user.apply(position)
    redirect_to candidate_positions_path, notice: 'Your application has been received.'
  end

  def destroy
    position = UserPositionRequest.find(params[:id]).position
    current_user.withdraw(position)
    redirect_to candidate_positions_path, notice: 'Your application has been withdrawn.'
  end

  private

    def require_to_be_candidate
      unless current_user.role.code == Role::CANDIDATE_ROLE_CODE
        render :file => "#{Rails.root}/public/401", :layout => false, :status => :unauthorized
      end
    end

end
