class GoodsController < ApplicationController
  before_action :move_to_index, except: [:index,:show]  

  def index
    @goods = Good.includes(:user).order("created_at DESC")
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  

  def show
    @good = Good.find(params[:id])
  end

  def destroy

  end
  
  private

  def good_params
    params.require(:good).permit(:name, :description, :category_id, 
      :condition_id, :delivery_load_id, :prefecture_id, :delivery_day_id,
       :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
