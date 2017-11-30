module PositionControllerConcern
  def position
    @position ||= current_user.positions.find params.require(:position_id)
  end
end

