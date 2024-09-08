class GrowthsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_child
  before_action :set_growth, only: [:show, :edit, :update, :destroy]

  def index
    @growths = @child.growths.order("record_date DESC")
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

  def show
  end

  def edit
  end

  def update
    if @growth.update(growth_params)
      redirect_to child_growth_path(@child, @growth)
    else
      render :edit
    end
  end

  def destroy
    @growth.destroy
    redirect_to child_growths_path(@child)
  end



  private

  def set_child
    @child = current_user.children.find(params[:child_id])
  end

  def set_growth
    @growth = @child.growths.find(params[:id])
  end

  def growth_params
    params.require(:growth).permit(:record_date, :growth_type_id, :height, :weight, :description, :image)
  end
end
