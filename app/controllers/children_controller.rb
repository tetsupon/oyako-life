class ChildrenController < ApplicationController
  def index
    @children = current_user.children
  end
end
