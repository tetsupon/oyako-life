class HealthrecordsController < ApplicationController
  def index
    @child = Child.find(params[:id])
  end
end
