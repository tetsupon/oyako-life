class HealthchecksController < ApplicationController
  before_action :set_child

  def index
    @healthchecks = @child.healthchecks.order(scheduled_date: :asc)
  end

  def new
    @healthcheck = @child.healthchecks.new
  end

  def create
    @healthcheck = @child.healthchecks.new(healthcheck_params)
    if @healthcheck.save
      redirect_to child_healthchecks_path(@child)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def healthcheck_params
    params.require(:healthcheck).permit(:checkup_name, :scheduled_date, :administered_date, :doctor_name, :description)
  end
end
