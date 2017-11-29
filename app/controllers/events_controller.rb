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

  def edit
    render locals: { event: find_event }
  end

  def update
    event = find_event

    if event.update_attributes(event_params)
      redirect_to position
    else
      render locals: { event: event }, action: :edit
    end
  end

  def destroy
    find_event.destroy

    redirect_to position
  end

  private

  def event_params
    params.require(:event).permit(
      :description,
      :event_on
    )
  end

  def find_event
    position.events.find params.require(:id)
  end

  def position
    @position ||= Position.find params.require(:position_id)
  end

end
