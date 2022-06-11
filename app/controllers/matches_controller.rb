class MatchesController < ApplicationController
  def index
    @good = Good.find(params[:good_id])
    @match = Match.new
  end

  def create 
    binding.pry
    @match = Match.new(match_params)
  end
  
  private

  def match_params
    params.require(:match).permit(:name, :description, :category_id, 
      :condition_id, :delivery_load_id, :prefecture_id, :delivery_day_id,
       :price, :image).merge(user_id: current_user.id)
  end
end
