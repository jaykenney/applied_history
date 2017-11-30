class PositionsController < ApplicationController
  helper_method :status_types

  def index
    render locals: { positions: current_user.positions.by_status.by_employer }
  end

  def show
    render locals: { position: find_position }
  end

  def new
    render locals: { position: current_user.positions.build }
  end

  def create
    position = current_user.positions.build(position_params)

    if position.save
      redirect_to position
    else
      render action: :new, locals: { position: position }
    end
  end

  def edit
    render locals: { position: find_position }
  end

  def update
    position = find_position

    if position.update(position_params)
      redirect_to position
    else
      render locals: { position: position }, action: :edit
    end
  end

  def destroy
    find_position.destroy

    redirect_to root_path
  end

  private

  def find_position
    current_user.positions.find params.require(:id)
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
