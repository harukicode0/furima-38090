class Good < ApplicationRecord
  # validates
  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality:{in: 300..9999999}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_load_id
      validates :delivery_day_id
      validates :prefecture_id
    end
    validates :image
  end
  

  # association
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_load

  has_one_attached :image

  private

  # def message_params
  #   params.require(:good).permit(:content, :image).merge(user_id: current_user.id)
  # end
end