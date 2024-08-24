class VaccinationsController < ApplicationController
  before_action :set_child
  before_action :set_vaccination, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @vaccination.update(vaccination_params)
      redirect_to child_vaccination_path(@child, @vaccination)
    else
      render :edit, status: :unprocessable_entit
    end
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def vaccination_params
    params.require(:vaccination).permit(:vaccination_name, :scheduled_date, :administered_date, :administered_by, :description)
  end

  def set_vaccination
    @vaccination = @child.vaccinations.find(params[:id])
  end
end
