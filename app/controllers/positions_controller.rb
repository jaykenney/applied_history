class PositionsController < ApplicationController
  helper_method :status_types

  def new
    render locals: { position: Position.new }
  end

  def create
    position = Position.new(position_params)

    if position.save
      redirect_to position
    else
      render action: :new, locals: { position: position }
    end
  end

  def show
    render locals: { position: find_position }
  end

  private

  def find_position
    Position.find params.require(:id)
  end

  def position_params
    params.require(:position).permit(
      :employer,
      :location,
      :source,
      :status,
      :title,
      :url
    )
  end

  def status_types
    Position.statuses.keys.map { |key| [key.titleize, key] }
  end
end
