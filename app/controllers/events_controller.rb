class EventsController < ApplicationController
  before_action :set_child

  def index
    @events = @child.events.order("created_at DESC")
  end

  def new
    @event = @child.events.build
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

end