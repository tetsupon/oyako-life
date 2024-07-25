class ChildrenController < ApplicationController
  before_action :authenticate_user!
  def index
    @children = current_user.children
  end

  def new
    @children = Child.new
  end

end
