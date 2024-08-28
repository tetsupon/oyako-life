class HealthchecksController < ApplicationController
  before_action :set_child
  before_action :set_healthcheck, only: [:show, :edit, :update, :destroy]


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

  def show
  end

  def edit
  end

  def update
    if @healthcheck.update(healthcheck_params)
      redirect_to child_healthcheck_path(@child, @healthcheck)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @healthcheck.destroy
    redirect_to child_healthchecks_path(@child)
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def set_healthcheck
    @healthcheck = @child.healthchecks.find(params[:id])
  end

  def healthcheck_params
    params.require(:healthcheck).permit(:checkup_name, :scheduled_date, :administered_date, :doctor_name, :description)
  end
end
