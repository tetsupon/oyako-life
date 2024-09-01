class HealthrecordsController < ApplicationController
  def top
    @child = Child.find(params[:id])
  end
end
