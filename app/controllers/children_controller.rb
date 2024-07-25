class ChildrenController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @children = current_user.children
  end

  def new
    @child = current_user.children.build
  end

  def create
    @child = current_user.children.build(child_params)
    if @child.save
      redirect_to children_path, notice: '子供情報が登録されました。'
    else
      render :new
    end
  end

  private

  def child_params
    params.require(:child).permit(:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, :gender)
  end
end

