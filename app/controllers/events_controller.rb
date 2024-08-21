class EventsController < ApplicationController
  before_action :set_child
  before_action :set_event, only: [:show, :edit, :update, :destroy]


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
      render :new, status: :unprocessable_entity
    end
  end  

  def show
  end


  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def set_event
    @event = @child.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:record_date, :event_type_id, :description, :images)
  end

end
