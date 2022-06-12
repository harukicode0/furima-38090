class Match < ApplicationRecord
  validates :good_id, uniqueness: true
  
  belongs_to :good
  belongs_to :user 
  has_one :buyer_address
end
