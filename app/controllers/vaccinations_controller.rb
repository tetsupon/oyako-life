class VaccinationsController < ApplicationController
  before_action :set_child

  def index
    @vaccinations = @child.vaccinations.order(scheduled_date: :asc)
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end
end