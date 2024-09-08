class MealsController < ApplicationController
  before_action :set_child
  before_action :set_meal, only: [:show, :edit, :update, :destroy]


  def index
    @meals = @child.meals.order("meal_date DESC")
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

  def show
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to child_meal_path(@child, @meal)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meal.destroy
    redirect_to child_meals_path(@child)
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def meal_params
    params.require(:meal).permit(:meal_date, :meal_type_id, :meal_name, :quantity, :description)
  end  

  def set_meal
    @meal = @child.meals.find(params[:id])
  end
end
