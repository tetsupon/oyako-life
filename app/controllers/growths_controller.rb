class GrowthsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_child

  def index
    @growths = @child.growths.order(record_date: :desc)
  end

  def set_child
    @child = current_user.children.find(params[:child_id])
  end
end
