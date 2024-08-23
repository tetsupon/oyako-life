class VaccinationsController < ApplicationController
  def index
    @vaccinations = @child.vaccinations.order(scheduled_date: :asc)
  end
end
