class Candidate::PositionsController < ApplicationController
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

end
