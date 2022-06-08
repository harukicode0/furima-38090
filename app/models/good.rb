class Good < ApplicationRecord
  # validates
  
  
  # association
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_load
end