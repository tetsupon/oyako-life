class MealsController < ApplicationController
  before_action :set_child

  def index
    @meals = @child.meals.order(meal_date: :desc)
  end

  def new
    @vaccination = @child.vaccinations.new
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end
end
