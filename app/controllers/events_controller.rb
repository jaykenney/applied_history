class EventsController < ApplicationController
  def new
    render locals: { event: position.events.build }
  end

  def create
    event = position.events.build(event_params)

    if event.save
      redirect_to position
    else
      render locals: { event: event }, action: :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :description,
      :event_on
    )
  end

  def position
    @position ||= Position.find params.require(:position_id)
  end

end
