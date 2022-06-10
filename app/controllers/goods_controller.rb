class GoodsController < ApplicationController
  before_action :move_to_index, except: [:index,:show, :destroy]  
  before_action :editor_is_correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

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
    good = Good.find(params[:id])
    good.destroy
    redirect_to root_path
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

  def editor_is_correct_user
    unless Good.find(params[:id]).user.id == current_user.id
      redirect_to root_path
    end
  end
end
