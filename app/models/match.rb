class Match < ApplicationRecord
  belongs_to :good
  belongs_to :user 
  has_one :buyer_address
end
