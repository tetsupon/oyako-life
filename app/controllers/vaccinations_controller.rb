class VaccinationsController < ApplicationController
  before_action :set_child

  def index
    @vaccinations = @child.vaccinations.order(scheduled_date: :asc)
  end

  def new
    @vaccination = @child.vaccinations.new
  end

  def create
    @vaccination = @child.vaccinations.new(vaccination_params)
    if @vaccination.save
      redirect_to child_vaccinations_path(@child)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def vaccination_params
    params.require(:vaccination).permit(:vaccination_name, :scheduled_date, :administered_date, :administered_by, :description)
  end
end
