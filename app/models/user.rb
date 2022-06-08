class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  Check_name_kanji_kana_hiragana_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  Check_name_kana_REGEX = /\A[ァ-ヶー]+\z/

  with_options presence: true do
    with_options format:{with:Check_name_kanji_kana_hiragana_REGEX, message: "は全角入力でお願いします"} do
      validates :first_name
      validates :last_name
    end
    with_options format:{with:Check_name_kana_REGEX, message: "は全角カタカナで入力をお願いします"} do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :nickname
    validates :birthday
  end
end
