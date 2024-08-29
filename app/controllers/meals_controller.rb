class MealsController < ApplicationController
  before_action :set_child

  def index
    @meals = @child.meals.order(meal_date: :desc)
  end

  def new
    @meal = @child.meals.new
  end

  def create
    @meal = @child.meals.build(meal_params)
    if @meal.save
      redirect_to child_meals_path(@child)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def meal_params
    params.require(:meal).permit(:meal_date, :meal_type_id, :meal_name, :quantity, :description)
  end  
end
