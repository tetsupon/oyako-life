class ChildrenController < ApplicationController
  before_action :authenticate_user!
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  
  def index
    @children = current_user.children
  end

  def new
    @child = Child.new
  end

  def create
    @child = current_user.children.build(child_params)
    if @child.save
      redirect_to children_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @child.update(child_params)
      redirect_to children_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path
  end
  

  private

  def set_child
    @child = current_user.children.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, :gende, :image)
  end
end

