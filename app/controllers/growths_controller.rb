class GrowthsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_child

  def index
    @growths = @child.growths.order(record_date: :desc)
  end

  def new
    @growth = @child.growths.new
  end

  def create
    @growth = @child.growths.new(growth_params)
    if @growth.save
      redirect_to child_growths_path(@child)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_child
    @child = current_user.children.find(params[:child_id])
  end

  def growth_params
    params.require(:growth).permit(:record_date, :growth_type_id, :height, :weight, :description)
  end
end