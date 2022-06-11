class MatchBuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :good_id, :address_number, :prefecture,
  :city, :banti, :building_name, :phone_number,:match_id

  address_number_regex = /\A[\d]{3}[-][\d]{4}\z/
  phone_number_ten_or_eleven_regex = /\A[\d]{10,11}\z/

  with_options presence: true do
    validates :user_id
    validates :good_id
    validates :address_number,format: { with: address_number_regex, message: "can't be blank" }
    validates :city
    validates :phone_number,format:{with:phone_number_ten_or_eleven_regex, message: "can't be blank"}
    validates :match_id
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    match = Match.create(user_id: user_id, good_id: good_id)
    BuyerAddress.create(address_number:address_number, prefecture_id:prefecture,
      city:city, banti:banti, building_name:building_name, phone_number:phone_number,
      match_id:match.id)
  end
end
