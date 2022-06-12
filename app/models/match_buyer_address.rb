class MatchBuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :good_id, :address_number, :prefecture_id,
  :city, :banti, :building_name, :phone_number,:token

  address_number_regex = /\A[\d]{3}[-][\d]{4}\z/
  phone_number_ten_or_eleven_regex = /\A[\d]{10,11}\z/
  check_name_kanji_kana_hiragana_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

  with_options presence: true do
    validates :user_id
    validates :good_id
    validates :address_number,format: { with: address_number_regex, message: "は○○○-(半角ハイフン)○○○○の形で入力してください(○は数字)" }
    validates :city, format: {with: check_name_kanji_kana_hiragana_REGEX, message: "は全角入力でお願いします"}
    validates :phone_number,format:{with:phone_number_ten_or_eleven_regex, message: "は１０〜１１桁の数字で入力してください"}
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    match = Match.create(user_id: user_id, good_id: good_id)
    BuyerAddress.create(address_number:address_number, prefecture_id:prefecture_id,
      city:city, banti:banti, building_name:building_name, phone_number:phone_number,
      match_id:match.id)
  end
end
