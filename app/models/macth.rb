class Macth < ApplicationRecord

  #association
  belongs_to :good
  belongs_to :user 
  has_one :buyer_address
end
