class Candidate::UserPositionRequestsController < ApplicationController

  def create
    position = Position.find(params[:position_id])
    current_user.apply(position)
    redirect_to candidate_positions_path, notice: 'Your application have been received.'
  end

end
