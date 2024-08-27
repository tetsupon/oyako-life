class HealthchecksController < ApplicationController
  before_action :set_child

  def index
    @healthchecks = @child.healthchecks.order(scheduled_date: :asc)
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end
end
