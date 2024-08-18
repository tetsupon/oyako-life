class EventsController < ApplicationController
  before_action :set_child

  def index
    @events = @child.events.order("created_at DESC")
  end

  def new
    @event = @child.events.build
  end

  def create
    @event = @child.events.new(event_params)
    if @event.save
      redirect_to child_events_path(@child)
    else
      render :new
    end
  end  

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def event_params
    params.require(:event).permit(:record_date, :event_type_id, :description, :image)
  end

end
