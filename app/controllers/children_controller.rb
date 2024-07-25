class ChildrenController < ApplicationController
  def index
    @children = current_user.children
  end

  def new
    @children = Child.new
  end
  
end
