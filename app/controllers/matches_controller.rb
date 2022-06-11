class MatchesController < ApplicationController
  def index
    @good = Good.find(params[:good_id])
    @match_buyer_address = MatchBuyerAddress.new
  end

  def create 
    binding.pry
    @match_buyer_address = MatchBuyerAddress.new(match_params)
  end
  
  private

  def match_params
    params.require(:match_buyer_address).permit(:good_id, :address_number, :prefecture,
      :city, :banti, :building_name, :phone_number,:match_id).merge(user_id: current_user.id)
  end
end
