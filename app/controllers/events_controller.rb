class EventsController < ApplicationController
  before_action :set_child

  def index
    @events = @child.events
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

end
