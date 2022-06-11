class MatchesController < ApplicationController
  def index
    @good = Good.find(params[:good_id])
    @match_buyer_address = MatchBuyerAddress.new
  end

  def create
    @match_buyer_address = MatchBuyerAddress.new(match_params)
    if @match_buyer_address.vaild?
      @match_buyer_address.save
      binding.pry
      pay_goods
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def match_params
    params.require(:match_buyer_address).permit(:good_id, :address_number,
       :prefecture,:city, :banti, :building_name, :phone_number,:match_id
      ).merge(user_id: current_user.id,good_id: params[:good_id],token: params[:token])
  end

  def pay_goods
    Payjp.api_key =   ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: match_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
