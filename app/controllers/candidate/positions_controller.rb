class Candidate::PositionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_to_be_candidate
  before_action :set_position, only: [:show]

  # GET /positions
  # GET /positions.json
  def index
    @positions = Position.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    def require_to_be_candidate
      unless current_user.role.code == Role::CANDIDATE_ROLE_CODE
        render :file => "#{Rails.root}/public/401", :layout => false, :status => :unauthorized
      end
    end

end
