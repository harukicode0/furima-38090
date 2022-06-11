class MatchesController < ApplicationController
  before_action :seach_good,only: [:index, :create]
  
  def index
    @match_buyer_address = MatchBuyerAddress.new
  end

  def create
    @match_buyer_address = MatchBuyerAddress.new(match_params)
    if @match_buyer_address.valid?
      @match_buyer_address.save
      pay_goods
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def match_params
    params.require(:match_buyer_address).permit(:good_id, :address_number,
       :prefecture_id,:city, :banti, :building_name, :phone_number
      ).merge(user_id: current_user.id,good_id: params[:good_id],token: params[:token])
  end

  def pay_goods
    Payjp.api_key =   ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @good.price,
      card: match_params[:token],
      currency: 'jpy'
    )
  end

  def seach_good
    @good = Good.find(params[:good_id])
  end
end
