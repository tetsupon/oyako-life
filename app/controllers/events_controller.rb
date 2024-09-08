class EventsController < ApplicationController
  before_action :set_child
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = @child.events.order("record_date DESC")
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

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to child_event_path(@child, @event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to child_events_path(@child)
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def set_event
    @event = @child.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:record_date, :event_type_id, :description, :image)
  end

end
