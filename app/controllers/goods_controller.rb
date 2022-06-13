class GoodsController < ApplicationController
  before_action :editor_is_correct_user, only: [:edit, :update,:destroy]
  before_action :find_good_record, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, except:[:index, :show]  
  before_action :sold_out_goods,only:[:edit,:update,:destroy]

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
  end

  def edit
  end

  def update
    if @good.update(good_params)
      redirect_to good_path
    else
      render 'edit'
    end
  end

  def destroy
    @good.destroy
    redirect_to root_path
  end

  private

  def good_params
    params.require(:good).permit(:name, :description, :category_id, 
      :condition_id, :delivery_load_id, :prefecture_id, :delivery_day_id,
       :price, :image).merge(user_id: current_user.id)
  end

  def editor_is_correct_user
    unless Good.find(params[:id]).user.id == current_user.id
      redirect_to root_path
    end
  end

  def find_good_record
    @good = Good.find(params[:id])
  end

  def sold_out_goods
    if @good.match
      redirect_to root_path
    end
  end
end
