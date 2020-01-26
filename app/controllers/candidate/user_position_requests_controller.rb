class Candidate::UserPositionRequestsController < ApplicationController

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

end
