class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :good_id, :address_number, :prefecture_id,
  :city, :banti, :building_name, :phone_number,:match_id
end
